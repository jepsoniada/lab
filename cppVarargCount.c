#define INVOKE(a,b,c, NAME, ...) NAME
#define GET(...) INVOKE(__VA_ARGS__, 3,2,1)
GET(a,b)