#include <stdio.h>

static int location_string[1024];

static int yy_string_get(void) {
  register char *c_str;
  register int c;
 
  c_str = location_string;
  c = EOF;
 
  /* If the string doesn't exist or is empty, EOF found */
  if (c_str && *c_str) {
    c = *c_str++;
    location_string = c_str;
  }
  return (c);
}
