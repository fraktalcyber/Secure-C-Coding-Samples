#include <assert.h>
#include <stddef.h>

#define ABS(x) (((x) < 0) ? -(x) : (x))
  
int func(int n) {
  /* Validate that n is within the desired range */
  int m = ABS(++n);
 
  /* ... */

  return m;
}
