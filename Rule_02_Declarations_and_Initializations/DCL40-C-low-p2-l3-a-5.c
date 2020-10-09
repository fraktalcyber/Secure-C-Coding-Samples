/* In a.c */
#include "bashline.h"
 
void f(const char *s, int i) {
  bash_groupname_completion_function(s, i);  /* UB 41 */
}
