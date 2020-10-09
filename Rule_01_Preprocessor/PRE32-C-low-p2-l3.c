#include <string.h>

char foo[128];

void func(const char *src) {
  /* Validate the source string; calculate size */
  char *dest = foo;
  /* malloc() destination string */
  memcpy(dest, src,
    #ifdef PLATFORM1
      12
    #else
      24
    #endif
  );
  /* ... */
}
