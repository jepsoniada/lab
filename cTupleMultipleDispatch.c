typedef struct {
  int _0;
  int _1;
} IntPair;

#define INVOKE(					\
	 _0,					\
	 _1,					\
	 _2,					\
	 NAME, ...) NAME
#define GET(...) INVOKE(__VA_ARGS__,		\
			TUPLE3,			\
			TUPLE2,			\
			TUPLE1)
#define TUPLE1(__0) \
  struct { __0 _0; }
#define TUPLE2(__0, __1) \
  struct { __0 _0; __1 _1; }
#define TUPLE3(__0, __1, __2) \
  struct { __0 _0; __1 _1; __2 _2; }
#define TUPLE(...) GET(__VA_ARGS__)(__VA_ARGS__)

int main() {
  IntPair a = { ._0 = 0, ._1 = 1 };
  TUPLE(long, int, short) b = { ._0 = 0, ._1 = 1 };
  return a._1;
}
