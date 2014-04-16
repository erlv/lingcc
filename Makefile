CXXFLAGS =	-O0 -g3 -Wall -Wextra -Werror -fmessage-length=0

FLEX = flex
BISON = bison
CXXC=g++
BFLAGS= -d

SRCS= cool.tab.cc  lingcc.cc lex.yy.cc
OBJS = cool.tab.o lingcc.o lex.yy.o

LIBS =

TARGET =	lingcc.exe

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)
	
%.o : %.cc
	${CXXC} ${CXXFLAGS} -c $<
	
cool.tab.cc : cool.yy
	${BISON} ${BFLAGS} -v $<
	
lex.yy.c : cool.l
	${FLEX} ${FFLAGS} --outfile=lex.yy.cc $<
	
all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET) cool.tab.cc cool.tab.h cool.tab.hh lex.yy.cc cool.output
