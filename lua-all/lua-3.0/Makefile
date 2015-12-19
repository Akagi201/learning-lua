OBJS0= fallback.o func.o hash.o inout.o lex.o luamem.o opcode.o parser.o table.o tree.o undump.o zio.o
OBJS= $(OBJS0) lua.o iolib.o mathlib.o strlib.o auxlib.o
OBJS2= $(OBJS0) luac.o dump.o print.o auxlib.o

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
