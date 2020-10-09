#include <stdarg.h>
  
int func(const char *cp, ...) {
  va_list ap; 
  va_start(ap, cp);
  int val = va_arg(ap, int);
  // ...
  va_end(ap);
  return val;
}
  
void f(void) {
  func("The only argument");
}
