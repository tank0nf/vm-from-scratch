flags=-O2 -std=c2x
ldflags=-lbu

.PHONY: all clean

all: clean tankvm

# tankvm: tankvm.o /home/bruno/Projects/BU/libbu.a
tankvm: tankvm.o
	cc $(flags) $^ -o $@ $(ldflags)

tankvm.o: tankvm.c tankvm.h
	cc $(flags) -c $<

clean:
	rm -f *.o tankvm