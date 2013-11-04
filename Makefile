# Makefile to build the article and code from 
#   Faria et al. 2020

# --- macros
CC = gcc
FCC = gfortran
CFLAGS=  -O3
FFLAGS= -ffree-form -O3
OBJECTS = hello.o complex-math.o
LIBS = -L/usr/local/lib/sprng/lib -llcg -L/usr/local/lib/pgplot -lcpgplot -lpgplot -lX11 -lftn -lm


# --- targets
all: code article
	@echo "\n Done! See article.pdf and README for further instructions..."


## code part
code: $(OBJECTS) 
	@echo "Linking programs..."
	$(CC) -o hello hello.o
	$(FCC) -o complex-math complex-math.o
	sleep 3
	 
hello.o: hello.c
	@echo "Compiling C code..."
	$(CC) $(CFLAGS) -c hello.c
	
complex-math.o: complex-math.f
	@echo "Compiling Fortran code..."
	$(FCC) $(FFLAGS) -c complex-math.f


## article part
article: 
	@echo "Compiling article from LaTeX source..."
	sleep 2

# --- remove binary and executable files
clean:
	rm -f hello complex-math $(OBJECTS)
