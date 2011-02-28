#import <UIKit/UIKit.h>

BOOL isCapable()
{
	if(![[NSFileManager defaultManager] fileExistsAtPath:@"/openiboot"]) {		//Check if OpeniBoot is installed
		return NO;
	}
	
	return YES;
}

BOOL isEnabled()
{
	return NO;
}

void setState(BOOL Enable)
{
	if(Enable) {
		notify_post("be.dawson.quickboot");		//Call the actual function as we need to be root to modify IOReg
	}
}

float getDelayTime()
{
	return 10.0f;	//10 seconds until reboot kicks in
}