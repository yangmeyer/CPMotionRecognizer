
//  Created by Yang Meyer on 30.01.12.
//  Copyright (c) 2012 compeople. All rights reserved.

#import "CPViewController.h"
#import "CPChildViewController.h"

@interface CPViewController ()
@property (nonatomic, strong) CPChildViewController* childVC;
@end

@implementation CPViewController

@synthesize childVC;

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	self.childVC = [[CPChildViewController alloc] init];
	
	if (SYSTEM_VERSION_LESS_THAN(@"5.0")) {
		[self presentModalViewController:self.childVC animated:YES];
	} else {
		[self presentViewController:self.childVC animated:YES completion:nil];
	}
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end
