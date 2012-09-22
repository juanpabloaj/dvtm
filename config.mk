# dvtm version
VERSION = 0.8

# Customize below to fit your system
OS = $(shell uname -s)
PREFIX = ${HOME}/opt
MANPREFIX = ${PREFIX}/share/man

INCS = -I. -I/usr/include -I/usr/local/include
ifeq ($(OS),Darwin)
	LIBS = -lc -lutil -lncurses
else
	LIBS = -lc -lutil -lncursesw
	STRIPFLAGS = -p
endif
# NetBSD
#LIBS = -lc -lutil -lcurses
# AIX
#LIBS = -lc -lncursesw
# Cygwin
#INCS += -I/usr/include/ncurses

CFLAGS += -std=c99 -Os ${INCS} -DVERSION=\"${VERSION}\" -DNDEBUG
LDFLAGS += -L/usr/lib -L/usr/local/lib ${LIBS}

DEBUG_CFLAGS = ${CFLAGS} -UNDEBUG -O0 -g -ggdb -Wall

CC = cc
