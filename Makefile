
cc=gcc
deps = conio.h conio.c Makefile

ifdef OS
opts=-D__windows__
exe=.exe
else
opts=-D__linux__
exe=.run
endif

all: main$(exe) blues$(exe) greens$(exe) reds$(exe) conio.a

conio.o: $(deps)
	$(cc) $(opts) -c conio.c

main$(exe): $(deps) conio.o main.c
	$(cc) $(opts) main.c conio.o -o main$(exe)

blues$(exe): $(deps) conio.o blues.c
	$(cc) $(opts) blues.c conio.o -o blues$(exe)

greens$(exe): $(deps) conio.o greens.c
	$(cc) $(opts) greens.c conio.o -o greens$(exe)

reds$(exe): $(deps) conio.o reds.c
	$(cc) $(opts) reds.c conio.o -o reds$(exe)

conio.a: conio.o
	ar rcs conio.a conio.o

clean:
	rm -f *.o
	rm -f *.a
	rm -f *$(exe)

