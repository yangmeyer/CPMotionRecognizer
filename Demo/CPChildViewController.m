
//  Created by Yang Meyer on 30.01.12.
//  Copyright (c) 2012 compeople. All rights reserved.

#import "CPChildViewController.h"
#import "UIResponder+MotionRecognizers.h"
#import <QuartzCore/QuartzCore.h>

@implementation CPChildViewController

@synthesize shakeFeedbackOverlay;

- (void) viewDidLoad {
	[super viewDidLoad];
	self.shakeFeedbackOverlay.alpha = 0.0;
	self.shakeFeedbackOverlay.layer.cornerRadius = 10.0;
}

- (void) viewWillAppear:(BOOL)animated {
	NSLog(@"child view controller will appear");
	[super viewWillAppear:animated];
	
	// Step 2 - Register for motion event:
	[self addMotionRecognizerWithAction:@selector(motionWasRecognized:)];
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	NSLog(@"child view controller was presented");
}

- (void) viewDidDisappear:(BOOL)animated {
	// Step 3 - Unregister:
	[self removeMotionRecognizer];
	
	[super viewDidDisappear:animated];
}

- (void) motionWasRecognized:(NSNotification*)notif {
	self.shakeFeedbackOverlay.alpha = 1.0;
	[UIView animateWithDuration:2.0 delay:0.0
						options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
					 animations:^{
		self.shakeFeedbackOverlay.alpha = 0.0;
	} completion:nil];
}

- (void)viewDidUnload {
	[self setShakeFeedbackOverlay:nil];
	[super viewDidUnload];
}

@end
