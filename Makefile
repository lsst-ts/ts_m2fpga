# Relative directores need to be defined before Makefile.inc is included,
# as the subdirectories have different relative locations.
RELATIVE_DIR ?= ./

include Makefile.inc

.PHONY: all clean deploy tests FORCE doc m2fpga

MKDIR_P ?= mkdir -p

# The -MMD and -MP flags help get the .o, .d, and other files in build/.
# Jenkins overwrites CPPFLAGS, so use CPPARGS instead.
CPPARGS ?= $(INC_FLAGS) $(CPP_FLAGS) -MMD -MP -DVERSION="\"$(VERSION)\""

# The main server application.
m2fpga: $(BIN_DIR)/m2fpga
	@echo 'make m2fpga'

# Make the bin dir and build the server main program.
$(BIN_DIR)/m2fpga: $(LIB_DIR)/libm2fpgacpp.a $(BUILD_DIR)/m2fpga.o
	mkdir -p bin
	$(CPP) $(OBJS) $(BUILD_DIR)/m2fpga.o -o $@ $(LDFLAGS) $(CPP_LIBS)

# Build the main server object.
$(BUILD_DIR)/m2fpga.o:
	$(CPP) $(CPPFLAGS) $(CXXFLAGS) $(CPPARGS) -c fpgaMain/main.cpp -o $@ $(CPP_LIBS)

$(LIB_DIR)/libm2fpgacpp.a: $(BUILD_DIR)/libm2fpgacpp.a
	mkdir -p lib
	mv $(BUILD_DIR)/libm2fpgacpp.a $(LIB_DIR)

$(BUILD_DIR)/libm2fpgacpp.a: $(OBJS)
	@echo '[AR ] $@'
	${co}$(AR) rs $@ $^

# all is not the default as it will build documentation.
all: doc m2fpga

clean:
	@$(foreach file,doc/html doc/latex,echo '[RM ] ${file}'; $(RM) -r $(file);)
#	@$(foreach dir,tests,$(MAKE) -C ${dir} $@;)
	$(RM) -r $(BUILD_DIR) $(LIB_DIR) $(BIN_DIR)

# The tests should stay out of the BUILD_DIR.
# tests: $(LIB_DIR)/libm2fpgacpp.a tests/Makefile tests/*.cpp
#	@${MAKE} -C tests

doc:
	${co}doxygen Doxyfile

# c++ source. Jenkins fills in CPPFLAGS and CXXFLAGS.
$(BUILD_DIR)/%.cpp.o: %.cpp
	$(MKDIR_P) $(dir $@)
	$(CPP) $(CPPFLAGS) $(CXXFLAGS) $(CPPARGS) -c $< -o $@ $(CPP_LIBS)

# assembly, kept for reference
#$(BUILD_DIR)/%.s.o: %.s
#	$(MKDIR_P) $(dir $@)
#	$(AS) $(ASFLAGS) -c $< -o $@

# c source, kept for reference
$(BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# This helps the compiler out with dependancies.
-include $(DEPS)
