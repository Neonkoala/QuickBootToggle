CC=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/arm-apple-darwin10-gcc-4.2.1
LD=$(CC)
LDFLAGS=-lobjc -dynamiclib -bind_at_load -F"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/System/Library/PrivateFrameworks" -F"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/System/Library/Frameworks" -L"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/usr/lib" -framework CoreTelephony -framework CoreFoundation -framework Foundation -framework UIKit -framework CoreGraphics -framework SystemConfiguration
CFLAGS=-fconstant-cfstrings -std=gnu99 -Wall -O2 -F"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/System/Library/PrivateFrameworks" -F"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/System/Library/Frameworks" -I"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/usr/include" -I..
VERSION=1.0

all:    Toggle.dylib

Toggle.dylib: main.o
	$(LD) $(LDFLAGS) -o $@ $^
	./ldid_intel -S Toggle.dylib

%.o: %.m
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
	   
%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

clean:
	rm -f *.o edge
