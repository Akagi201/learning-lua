OBJS0= lapi.o lbuffer.o lbuiltin.o ldo.o lfunc.o lgc.o llex.o lmem.o lobject.o lparser.o lstate.o lstring.o ltable.o ltm.o lundump.o lvm.o lzio.o 
OBJS= $(OBJS0) lua.o lauxlib.o ldblib.o liolib.o lmathlib.o lstrlib.o linit.o
OBJS2= $(OBJS0) luac.o dump.o opcode.o opt.o print.o test.o lauxlib.o #stubs.o

CFLAGS= -Wall -O2

T= lua

all:	$T luac
	./$T test.lua
	./luac -l test.lua

$T:	$(OBJS)
	$(CC) -o $@ $(OBJS) -lm

luac:	$(OBJS2)
	$(CC) -o $@ $(OBJS2) -lm

clean:
	rm -f $T $(OBJS) $(OBJS2) core core.* luac.out luac

diff:
	diff ORIG . | grep -v ^Only > DIFFS
