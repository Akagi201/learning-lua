OBJS0= lapi.o lcode.o ldo.o ldebug.o lfunc.o lgc.o llex.o lmem.o lobject.o lparser.o lstate.o lstring.o ltable.o ltm.o lundump.o lvm.o lzio.o 
OBJS= $(OBJS0) lua.o lauxlib.o lbaselib.o ldblib.o liolib.o lmathlib.o lstrlib.o
OBJS2= $(OBJS0) luac.o dump.o opt.o print.o lauxlib.o #stubs.o

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
