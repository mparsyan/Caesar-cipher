LIB = lib/libcesar.so
UNITTEST = bin/unit_test
CC = g++
INC = -Iinc
UNITTEST = bin/unittest
UNITTEST_SOURCES = src/main.cpp

.PHONY: all clean

all: $(LIB) $(UNITTEST)

$(LIB): $(LIB_SOURCES)
	$(CC) -c $(INC) -o obj/encode.o src/encode.cpp $(CFLAGS)
	$(CC) -c $(INC) -o obj/decode.o src/decode.cpp $(CFLAGS)
	ar rvs $(LIB) obj/encode.o obj/decode.o

$(UNITTEST): $(UNITTEST_SOURCES)
	$(CC) $(INC) -c $< $(CFLAGS)
	$(CC) $(INC) -L lib -lcesar -o $@ main.o $(CFLAGS)

clean:
	rm -f obj/* bin/* lib/*
