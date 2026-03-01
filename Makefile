CC = gcc
CFLAGS = -Wall
TARGET = shell-ish
SRC = shellish-skeleton.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)

.PHONY: all clean
