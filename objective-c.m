// -*- compile-command: "gcc objective-c.m `gnustep-config --objc-flags` -l gnustep-base -l objc -o a && ./a" -*-

#import <Foundation/Foundation.h>

void app() {
  NSLog(@"%d", 9 + 10);
}

int main(int argCount, const char* argv[]) {
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  app();
  [pool drain];
  return 0;
}
