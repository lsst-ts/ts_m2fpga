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
EXECUTABLE = demo
OBJECTS = demo.o NiFpga.o

# Include header file directories
INC := -I ./fpgaInterface

all: $(OBJECTS)
	$(CC) $(SRCDIR)/demo.o fpgaInterface/NiFpga.o $(LDFLAGS) -o $(EXECUTABLE)

demo.o:
	$(CC) -c $(SRCDIR)/demo.c -o $(SRCDIR)/demo.o

NiFpga.o:
	$(CC) -c fpgaInterface/NiFpga.c -o fpgaInterface/NiFpga.o

clean:
	rm -f $(EXECUTABLE) fpgaInterface/NiFpga.o $(SRCDIR)/demo.o