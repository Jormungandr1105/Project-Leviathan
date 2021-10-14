CXX=g++
CXXFLAGS=-std=c++1z -g
MAIN=bin/leviathan
SRC_DIR=src
SRCS=$(wildcard $(SRC_DIR)/*.cpp)
INCLUDES= -I./include
OBJS=$(SRCS:.ccp=.o)

.PHONY: all clean

all: makefolder $(MAIN)

$(MAIN): $(OBJS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS)

makefolder:
	@if [ ! -d bin ]; then\
		mkdir bin;\
	fi

.cpp.o:
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c -o $@ $<

clean:
	$(RM) $(MAIN) $(SRC_DIR)/*.o *~
