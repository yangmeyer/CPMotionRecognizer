
//  Created by Yang Meyer on 30.01.12.
//  Copyright (c) 2012 compeople. All rights reserved.

#import "CPChildViewController.h"

@implementation CPChildViewController

- (BOOL) canBecomeFirstResponder {
	return YES;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
	[super motionEnded:motion withEvent:event];
	NSLog(@"child -motionEnded:withEvent:");
}

- (void) viewWillAppear:(BOOL)animated {
	NSLog(@"child view controller will appear");
	[super viewWillAppear:animated];
	
	if (SYSTEM_VERSION_LESS_THAN(@"5.0")) {
		NSAssert([[self parentViewController] isFirstResponder],
				 @"In iOS 4.x, the parent view controller is still the first responder before the child's view appears.");
	} else {
		NSAssert([[self presentingViewController] isFirstResponder],
				 @"In iOS 5, the presenting view controller is still the first responder before the presented view controller's view appears.");
	}
	
	NSAssert([self isFirstResponder] == NO, @"Child/modal view controller is NOT first responder before appearing.");	
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	UIWindow* keyWindow = [[UIApplication sharedApplication] keyWindow];
	UIResponder* firstResponder = [keyWindow performSelector:@selector(firstResponder)]; // undocumented method
	
	if (SYSTEM_VERSION_LESS_THAN(@"5.0")) {
		NSAssert([self isFirstResponder] == NO,
				 @"In iOS 4.x, the modal view controller does not become first responder upon being shown.");
	} else {
		NSAssert(firstResponder == self,
				 @"The window's purported first responder should be the presented view controller.");
		NSAssert([self isFirstResponder],
				 @"In iOS 5, the presented view controller has become first responder in viewDidAppear.");
	}
	
	NSLog(@"child view controller was presented");
}

@end
