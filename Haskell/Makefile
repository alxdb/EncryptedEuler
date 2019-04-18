src = $(wildcard *.hs)
exe = $(patsubst %.hs, bin/%, $(src))

GCC ?= stack ghc --

all : bin $(exe)

bin :
	mkdir -p bin

bin/% : %.hs
	$(GCC) -O2 $< -o $@
	@rm *.hi
	@rm *.o

clean :
	rm -f bin/*
