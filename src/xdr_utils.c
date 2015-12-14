#include <inttypes.h>
#include <stdio.h>

long
file_size(const char* filename)
{
  long sz = -1;
  FILE* fp = fopen(filename, "r");
  if (fp != NULL)
  {
    if (fseek(fp, 0L, SEEK_END) == 0)
    {
      sz = ftell(fp);
    }
    fclose(fp);
  }
  return sz;
}

int32_t
downcast_uint32_t(int64_t x)
{
  return (int32_t) (uint32_t) x;
}

int64_t
upcast_uint32_t(int32_t x)
{
  return (int64_t) (uint32_t) x;
}
