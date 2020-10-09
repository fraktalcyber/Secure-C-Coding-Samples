#include <limits.h>
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
/* #include <stdlib.h> is missing */

extern foo;
  
int main(void) {
  for (size_t i = 0; i < 100; ++i) {
    /* int malloc() assumed */
    char *ptr = (char *)malloc(0x10000000);
    *ptr = 'a';
  }
  return 0;
}


