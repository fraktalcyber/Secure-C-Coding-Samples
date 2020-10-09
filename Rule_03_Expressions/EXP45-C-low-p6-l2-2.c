int foo()
{
  return 1;
}

void bar(int x, int y)
{

 do { /* ... */ } while (foo(), x = y);
}
