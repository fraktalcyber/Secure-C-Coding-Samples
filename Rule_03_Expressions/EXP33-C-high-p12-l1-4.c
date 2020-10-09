#include <string.h>
#include <wchar.h>
  
size_t func(const char *mbs) {
  size_t len;
  mbstate_t state;
 
  len = mbrlen(mbs, strlen(mbs), &state);
  return len;
}
