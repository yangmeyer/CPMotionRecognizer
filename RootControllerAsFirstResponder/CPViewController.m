
//  Created by Yang Meyer on 30.01.12.
//  Copyright (c) 2012 compeople. All rights reserved.

#import "CPViewController.h"
#import "CPChildViewController.h"

@interface CPViewController ()
@property (nonatomic, strong) CPChildViewController* childVC;
@end

@implementation CPViewController

@synthesize childVC;

- (BOOL) canBecomeFirstResponder {
	return YES;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
	[super motionEnded:motion withEvent:event];
	NSLog(@"root -motionEnded:withEvent:");
}

#pragma mark -

#pragma mark - View lifecycle

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self becomeFirstResponder];
	
	self.childVC = [[CPChildViewController alloc] init];
	
	if (SYSTEM_VERSION_LESS_THAN(@"5.0")) {
//		[self resignFirstResponder]; // doing this means "nobody" has the first-responder status, i.e. text-fields can get it but motion events are not recognized any more
		[self presentModalViewController:self.childVC animated:YES];
	} else {
		[self presentViewController:self.childVC animated:YES completion:nil];
	}
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return YES;
	}
}

@end
