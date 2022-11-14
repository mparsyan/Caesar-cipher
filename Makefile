CC = g++
INC = -I./inc/
CFLAGS = -Wall -Wextra -Werror
.PHONY: all clean

all: bin/unittest

obj/encode.o obj/decode.o: $(LIB_SOURCES)
	$(CC) -c $(INC) -o obj/encode.o src/encode.cpp $(CFLAGS)
	$(CC) -c $(INC) -o obj/decode.o src/decode.cpp $(CFLAGS)

lib/libencode.so lib/libdecode.so: obj/encode.o obj/decode.o
	$(CC) -fPIC -shared obj/encode.o -o lib/libencode.so
	$(CC) -fPIC -shared obj/decode.o -o lib/libdecode.so

bin/unittest: lib/libencode.so lib/libdecode.so
	$(CC) src/main.cpp $(INC) -L./lib -lencode -ldecode -o bin/main $(CFLAGS)
	export LD_LIBRARY_PATH=`pwd`/lib && ./bin/main

clean:
	rm -f obj/* bin/* lib/*
