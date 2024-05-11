
cc=gcc
deps = conio.h conio.c Makefile

ifdef OS
opts=-D__windows__
exe=.exe
else
opts=-D__linux__
exe=.run
endif

all: main$(exe) conio.a

conio.o: $(deps)
	$(cc) $(opts) -c conio.c

main$(exe): $(deps) conio.o main.c
	$(cc) $(opts) main.c conio.o -o main$(exe)

conio.a: conio.o
	ar rcs conio.a conio.o

clean:
	rm -f *.o
	rm -f *.a
	rm -f *$(exe)

