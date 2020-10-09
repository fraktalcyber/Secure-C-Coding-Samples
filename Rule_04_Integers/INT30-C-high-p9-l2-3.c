#include <stdlib.h>

struct pen {
  int num_vertices;
  void *vertices;
};

void foo(struct pen *pen)
{
  pen->num_vertices = 50000;
pen->vertices = malloc(
  pen->num_vertices * sizeof(struct pen)
);
}
