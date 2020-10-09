#include <limits.h>
 
void func(signed int si) {
  /* Cast eliminates warning */
  unsigned int ui = (unsigned int)si;
 
  /* ... */
}
 
/* ... */

void main(void)
{
func(INT_MIN);
}
