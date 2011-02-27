#import <UIKit/UIKit.h>
#import <IOKit/IOKitLib.h>

#include <unistd.h>
#include <stdlib.h>
#include <ctype.h>
#include <sys/reboot.h>

#undef NSEC_PER_USEC
#undef USEC_PER_SEC
#undef NSEC_PER_SEC

int main(int argc, char *argv[]) {
	kern_return_t   kr;
	io_iterator_t   io_objects;
	io_service_t    io_service;
	
	//CFMutableDictionaryRef child_props;
	CFMutableDictionaryRef service_properties;
	
	kr = IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODTNVRAM"), &io_objects);
	
	if(kr != KERN_SUCCESS)
		return -1;
	
	while((io_service= IOIteratorNext(io_objects)))
	{
		kr = IORegistryEntryCreateCFProperties(io_service, &service_properties, kCFAllocatorDefault, kNilOptions);
		if(kr == KERN_SUCCESS)
		{
			NSMutableDictionary *nvramDict = (NSMutableDictionary *)service_properties;
			
			NSString *target = @"2";
			
			NSData *rawTempOS = [target dataUsingEncoding:NSUTF8StringEncoding];
			[nvramDict setObject:rawTempOS forKey:@"opib-temp-os"];
			
			IORegistryEntrySetCFProperties(io_service, service_properties);
			
			CFRelease(service_properties);
		}
		
		IOObjectRelease(io_service);
	}
	
	IOObjectRelease(io_objects);
	
	reboot(0);
	
	return 0;
}

