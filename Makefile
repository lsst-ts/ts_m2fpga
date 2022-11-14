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
EXECUTABLE = fifoRead
OBJECTS = fifoRead.o NiFpga.o

# Include header file directories
INC := -I ./fpgaInterface

all: $(OBJECTS)
	$(CC) $(SRCDIR)/fifoRead.o fpgaInterface/NiFpga.o $(LDFLAGS) -o $(EXECUTABLE)

fifoRead.o:
	$(CC) -c $(SRCDIR)/fifoRead.c -o $(SRCDIR)/fifoRead.o

NiFpga.o:
	$(CC) -c fpgaInterface/NiFpga.c -o fpgaInterface/NiFpga.o

clean:
	rm -f $(EXECUTABLE) fpgaInterface/NiFpga.o $(SRCDIR)/fifoRead.o