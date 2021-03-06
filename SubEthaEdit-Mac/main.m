//  main.m
//  SubEthaEdit
//
//  Created by Martin Ott on Tue Feb 24 2004.

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[]) {
#ifdef BETA
#ifdef BETA_EXPIRE_DATE
	@autoreleasepool {
#define STRINGIZE(x) #x
#define STRINGIZE2(x) STRINGIZE(x)
#define BETA_EXPIRE_DATE_LITERAL @ STRINGIZE2(BETA_EXPIRE_DATE)
	
		NSString *expireDateString = BETA_EXPIRE_DATE_LITERAL;
		
		NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
		NSLocale *enUSPOSIXLocale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease];
		[dateFormatter setLocale:enUSPOSIXLocale];
		[dateFormatter setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss' 'xx"];
		
		NSDate *expireDate = [dateFormatter dateFromString:expireDateString];
		
		NSDate *today = [NSDate date];
		if ([today compare:expireDate] == NSOrderedDescending) {
			NSLog(@"THIS BETA IS EXPIRED!");
			
			NSAlert *alert = [[[NSAlert alloc] init] autorelease];
			alert.messageText = @"This beta version of SubEthaEdit has expired.";
			alert.informativeText = @"Please visit http://subethaedit.net/ to download a new version.";
			
			[alert runModal];
			return 0;
		}
	}
#endif
#endif

	return NSApplicationMain(argc, (const char **) argv);
}
