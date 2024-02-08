CC := clang
CFLAGS := -Wall -Wextra -Iinclude
LDFLAGS := -lncurses

SRC_DIR := src
OBJ_DIR := bin
BIN_DIR := bin

SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))

TARGET := $(BIN_DIR)/tetris

$(TARGET): $(OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean

clean:
	rm -rf $(OBJ_DIR)/*.o $(TARGET)
