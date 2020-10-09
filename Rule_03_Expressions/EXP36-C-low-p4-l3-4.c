#include <stdio.h>
#include <stdint.h>
 
#define READ_UINT16(ptr)       (*(uint16_t *)(ptr))
#define WRITE_UINT16(ptr, val) (*(uint16_t *)(ptr) = (val))
 
void compute(unsigned char *b1, unsigned char *b2,
             int value, int range) {
  int i;
  for (i = 0; i < range; i++) {
    int newval = (int)READ_UINT16(b1) + value;
    WRITE_UINT16(b2, newval);
    b1 += 2;
    b2 += 2;
  }
}
 
int main() {
  unsigned char buffer1[1024];
  unsigned char buffer2[1024];
  printf("Compute something\n");
  compute(buffer1 + 3, buffer2 + 1, 42, 500);
  return 0;
}
