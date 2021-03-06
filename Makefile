# Copyright (C) 2013  Nithin Nellikunnu, Radisys India Pvt Ltd
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

include make.in

BIN = gsim
SRC_PATH = ./src
OBJ_PATH = .
LIBS= -lpthread -lncurses

ifeq ($(profiling), yes)
LFLAGS += -pg
CFLAGS += -pg
endif

ifeq ($(debug), yes)
COPTS += -DDEBUG
endif

SRC=\
	$(SRC_PATH)/logger.cpp \
	$(SRC_PATH)/timer.cpp \
	$(SRC_PATH)/keyboard.cpp \
	$(SRC_PATH)/thread.cpp \
	$(SRC_PATH)/socket.cpp \
	$(SRC_PATH)/gtp_stats.cpp \
	$(SRC_PATH)/gtp_ie.cpp \
	$(SRC_PATH)/gtp_msg.cpp \
	$(SRC_PATH)/gtp_util.cpp \
	$(SRC_PATH)/procedure.cpp \
	$(SRC_PATH)/scenario.cpp \
	$(SRC_PATH)/pugixml.cpp \
	$(SRC_PATH)/xml_parser.cpp \
	$(SRC_PATH)/sim_cfg.cpp \
	$(SRC_PATH)/traffic.cpp \
	$(SRC_PATH)/session.cpp \
	$(SRC_PATH)/gtp_peer.cpp \
	$(SRC_PATH)/task.cpp \
	$(SRC_PATH)/display.cpp \
	$(SRC_PATH)/sim.cpp \
	$(SRC_PATH)/help.cpp \
	$(SRC_PATH)/tunnel.cpp \
	$(SRC_PATH)/main.cpp

OBJ=$(SRC:.cpp=.o)
all: $(SRC) $(BIN)

$(BIN): $(OBJ)
	@echo "Building simulator ..."
	$(CC) $(OBJ) $(LIBS) $(LFLAGS) -o $@

.cpp.o:
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

.PHONY: clean
clean:
	@echo "Cleaning the build ..."
	$(RM) $(BIN) $(OBJ)
