CC=clang

all:
	$(CC) -Wall -c */*.c || true

.PHONY: clean

clean:
	rm -f *.o */*.gch
