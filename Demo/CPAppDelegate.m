
//  Created by Yang Meyer on 30.01.12.
//  Copyright (c) 2012 compeople. All rights reserved.

#import "CPAppDelegate.h"
#import "CPViewController.h"
#import "CPMotionRecognizingWindow.h"

@implementation CPAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
	
	// Step 1 - Use the motion-detecting UIWindow subclass:
	self.window = [[CPMotionRecognizingWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
		self.viewController = [[CPViewController alloc] initWithNibName:@"CPViewController_iPhone" bundle:nil];
	} else {
		self.viewController = [[CPViewController alloc] initWithNibName:@"CPViewController_iPad" bundle:nil];
	}
	self.window.rootViewController = self.viewController;
	[self.window makeKeyAndVisible];
	return YES;
}

@end
