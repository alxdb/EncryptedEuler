src = $(wildcard *.c)
exe = $(patsubst %.c, bin/%, $(src))

all : $(exe)

bin/% : %.c
	mkdir -p bin
	cc $< -o $@

clean :
	rm -f $(exe)
