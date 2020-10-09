       #include <unistd.h>
       #include <sys/types.h>

void foo()
{

if (!(getuid() & geteuid() == 0)) {
  /* ... */
} 

}
