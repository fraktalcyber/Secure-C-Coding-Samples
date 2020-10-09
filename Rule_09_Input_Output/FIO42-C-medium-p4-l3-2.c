#include <stdio.h>
#include <stdlib.h>

extern char*filename;

int main(void) {
  FILE *f = fopen(filename, "w");
  if (NULL == f) {
    exit(EXIT_FAILURE);
  }
  /* ... */
  exit(EXIT_SUCCESS);
}
