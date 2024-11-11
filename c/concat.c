#include <stdio.h>

#define STRR(x) #x
#define STR(x) STRR(x)
#define ID(x) x

int main() {
  /* const char* hello = "Hello"; */
#define hello "Hello"
  /* const char* world = "World"; */
#define world all of worlds
  printf(hello
	 " "
	 STR(world)
	 "\n");
  return 0;
}
