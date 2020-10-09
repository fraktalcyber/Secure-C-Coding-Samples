#include <stdarg.h>
#include <stddef.h>
 
int func(size_t num_vargs, ...) {
  va_list ap;
  unsigned char ret = 0; 
  va_start(ap, num_vargs);
  if (num_vargs > 0) {
    unsigned char c = va_arg(ap, unsigned char);
    // ...
    ret = c;
  }
  va_end(ap);
  return ret;
}
  
void f(void) {
  unsigned char c = 0x12;
  func(1, c);
}
