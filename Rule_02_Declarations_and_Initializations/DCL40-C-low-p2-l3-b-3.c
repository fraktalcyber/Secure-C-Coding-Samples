/* In b.c */
long f(long a) {   /* UB 15 */
  return a * 2;
}
