#Jonathan Lawrence
#CS3377.501
#jml160230@utdallas.edu
#Makefile for program4


# Flags for C++ implicit rules
CXX = g++
CPPFLAGS = -Wall -I /scratch/perkins/include

# Library flags
LDFLAGS = -L /scratch/perkins/lib
LIBS = -l cdk -lcurses  

PROJECTNAME = CS3377.Program6.CDKGit

EXEC = program6

OBJS = BinaryFileHeader.o BinaryFileRecord.o

########################################################################

all: $(EXEC)

clean:
	rm -f $(OBJS) $(EXEC) *~ \#*

$(EXEC): $(OBJS)
	$(CXX) -o $@ $(OBJS)

backup:
	@make clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename "`pwd`"))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME) 2> /dev/null
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!
