/* In a.c */
extern int f(int a);   /* UB 15 */
 
int g(int a) {
  return f(a);   /* UB 41 */
}
