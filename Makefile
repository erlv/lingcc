CXXFLAGS =	-O0 -g3 -Wall -Wextrac -Werror -fmessage-length=0

FLEX = flex
BISON = bison
CC=g++
BFLAGS= -d

SRCS= cool.tab.c  lingcc.cpp lex.yy.c
OBJS = cool.tab.o lingcc.o lex.yy.o

LIBS =

TARGET =	lingcc.exe

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)
	
%.o : %.cpp
	${CC} ${CFLAGS} -c $<
	
cool.tab.c : cool.y
	${BISON} ${BFLAGS} cool.y
	
lex.yy.c : cool.flex
	${FLEX} ${FFLAGS} cool.flex
	
all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
