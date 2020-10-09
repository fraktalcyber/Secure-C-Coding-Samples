#include <stdio.h>
#include <stdint.h>
#include <sys/types.h>
#include <sys/socket.h>

/* sock is a connected TCP socket */

void func(int sock)
{
uint32_t num;
 
if (recv(sock, (void *)&num, sizeof(uint32_t), 0) < (int)sizeof(uint32_t)) {
  /* Handle error */
}
 
printf("We received %u from the network!\n", (unsigned int)num);
}
