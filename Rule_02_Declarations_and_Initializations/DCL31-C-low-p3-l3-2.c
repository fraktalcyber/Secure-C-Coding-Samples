#include <limits.h>
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
/* #include <stdlib.h> is missing */

foo(void) {
  return UINT_MAX;
}
 
int main(void) {
  long long int c = foo();
  printf("%lld\n", c);
  return 0;
}

