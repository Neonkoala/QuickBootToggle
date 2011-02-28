CC=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/arm-apple-darwin10-gcc-4.2.1
LD=$(CC)
LDFLAGS=-lobjc -F"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/System/Library/PrivateFrameworks" -F"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/System/Library/Frameworks" -L"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/usr/lib" -framework CoreFoundation -framework Foundation -framework UIKit -lIOKit
CFLAGS=-fconstant-cfstrings -std=gnu99 -Wall -O2 -miphoneos-version-min=3.1.2 -F"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/System/Library/PrivateFrameworks" -F"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/System/Library/Frameworks" -I"/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk/usr/include" -Iinc -I..
VERSION=1.0

all:    be.dawson.quickboot

be.dawson.quickboot: quickboot.o
	$(LD) $(LDFLAGS) -o $@ $^
	../ldid_intel -S be.dawson.quickboot

%.o: %.m
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
	   
%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

clean:
	rm -f *.o edge
