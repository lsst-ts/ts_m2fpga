#----------------------------------------------------------------------------
# Macros
#----------------------------------------------------------------------------

# Compiler to use
CC := gcc

#----------------------------------------------------------------------------
# Setting of target
#----------------------------------------------------------------------------

# Source file directories
SRCDIR := ./src

# Directory of executable
BINDIR := ./bin

LDFLAGS = -ldl
EXECUTABLE = crio
OBJECTS = demo.o NiFpga.o

# Include header file directories
INC := -I ./include

all: $(OBJECTS)
	$(CC) $(SRCDIR)/demo.o include/NiFpga.o $(LDFLAGS) -o $(EXECUTABLE)

demo.o:
	$(CC) -c $(SRCDIR)/demo.c -o $(SRCDIR)/demo.o

NiFpga.o:
	$(CC) -c include/NiFpga.c -o include/NiFpga.o

clean:
	rm -f $(EXECUTABLE) include/NiFpga.o $(SRCDIR)/demo.o