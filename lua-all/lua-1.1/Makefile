OBJS= hash.o inout.o lex.o opcode.o table.o y.tab.o lua.o iolib.o mathlib.o strlib.o

CFLAGS= -Wall -O2 -I.

T= lua

all:	$T
	./$T test.lua

$T:	$(OBJS)
	$(CC) -o $@ $(OBJS) -lm

clean:
	rm -f $T $(OBJS) core core.*

diff:
	diff ORIG . | grep -v ^Only > DIFFS
