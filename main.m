#import <UIKit/UIKit.h>

UIWindow* getAppWindow() {
	UIWindow* TheWindow = nil;
	UIApplication* App = [UIApplication sharedApplication];
	NSArray* windows = [App windows];
	int i;
	
	for(i = 0; i < [windows count]; i++) {
		TheWindow = [windows objectAtIndex:i];
		if([TheWindow respondsToSelector:@selector(getCurrentTheme)])
		{
			break;
		}
	}
	
	if(i == [windows count]) {
		TheWindow = [App keyWindow];
	}
	
	return TheWindow;
}

BOOL isCapable() {
	if(![[NSFileManager defaultManager] fileExistsAtPath:@"/openiboot"]) {		//Check if OpeniBoot is installed
		return NO;
	}
	
	return YES;
}

BOOL isEnabled() {
	return NO;
}

void setState(BOOL Enable) {
	if(Enable) {
		notify_post("be.dawson.quickboot");		//Call the actual function as we need to be root to modify IOReg
		
		sleep(3);
		
		UIWindow* Window = getAppWindow();
		[Window closeButtonPressed];
	}
}

float getDelayTime() {
	return 3.0f;	//10 seconds until reboot kicks in
}