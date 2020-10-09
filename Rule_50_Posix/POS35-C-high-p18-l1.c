#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

void func()
{
char *filename = /* file name */ "foo";
char *userbuf = /* user data */ "bar";
unsigned int userlen = /* length of userbuf string */ 3;
 
struct stat lstat_info;
int fd = 0;
/* ... */
if (lstat(filename, &lstat_info) == -1) {
  /* Handle error */
}
 
if (!S_ISLNK(lstat_info.st_mode)) {
   fd = open(filename, O_RDWR);
   if (fd == -1) {
       /* Handle error */
     abort();
   }
}
if (write(fd, userbuf, userlen) < userlen) {
  /* Handle error */
}
}
