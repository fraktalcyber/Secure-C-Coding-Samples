#include <stddef.h>
#include <string.h>
 
struct test {
  int a;
  char b;
  int c;
};
 
/* Safely copy bytes to user space */
extern int copy_to_user(void *dest, void *src, size_t size);
 
void do_stuff(void *usr_buf) {
  struct test arg = {.a = 1, .b = 2, .c = 3};
  copy_to_user(usr_buf, &arg, sizeof(arg));
}

struct test {
  int a;
  char b;
  int c;
};
 
/* Safely copy bytes to user space */
extern int copy_to_user(void *dest, void *src, size_t size);
 
void do_stuff(void *usr_buf) {
  struct test arg;
 
  /* Set all bytes (including padding bytes) to zero */
  memset(&arg, 0, sizeof(arg));
 
  arg.a = 1;
  arg.b = 2;
  arg.c = 3;
 
  copy_to_user(usr_buf, &arg, sizeof(arg));
}

struct test {
  unsigned a : 1;
  unsigned : 0;
  unsigned b : 4;
};
 
/* Safely copy bytes to user space */
extern int copy_to_user(void *dest, void *src, size_t size);
 
void do_stuff(void *usr_buf) {
  struct test arg = { .a = 1, .b = 10 };
  copy_to_user(usr_buf, &arg, sizeof(arg));
}
