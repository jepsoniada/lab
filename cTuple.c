typedef struct {
  int _0;
  int _1;
} IntPair;

#define CAT(a, ...) a ## __VA_ARGS__
#define XCAT(a, ...) CAT(a, __VA_ARGS__)
#define TUPLE(...) struct { GET(__VA_ARGS__)(LENGTH_DEC(__VA_ARGS__), __VA_ARGS__) }

#define INVOKE(					\
	 _0,					\
	 _1,					\
	 _2,					\
	 NAME, ...) NAME
#define LENGTH_DEC(...) INVOKE(__VA_ARGS__,	\
			       2,		\
			       1,		\
			       0)
#define INDEX0(...) INVOKE(__VA_ARGS__,		\
			   ,			\
			   ,			\
			   0)
#define INDEX1(...) INVOKE(__VA_ARGS__,		\
			   ,			\
			  0,			\
			  1)
#define INDEX2(...) INVOKE(__VA_ARGS__,		\
			  0,			\
			  1,			\
			  2)
#define TUPLE_FIELDS_0(len, a, ...) a XCAT(_, XCAT(INDEX, len)(__VA_ARGS__));
#define TUPLE_FIELDS_1(len, a, ...) a XCAT(_, XCAT(INDEX, len)(,__VA_ARGS__)); TUPLE_FIELDS_0(len, __VA_ARGS__)
#define TUPLE_FIELDS_2(len, a, ...) a XCAT(_, XCAT(INDEX, len)(,__VA_ARGS__)); TUPLE_FIELDS_1(len, __VA_ARGS__)
#define GET(...) INVOKE(__VA_ARGS__,		\
			TUPLE_FIELDS_2,		\
			TUPLE_FIELDS_1,		\
			TUPLE_FIELDS_0)

int main() {
  IntPair a = { ._0 = 0, ._1 = 1 };
  TUPLE(long, int, short) b = { ._0 = 0, ._1 = 1 };
  return a._1;
}
