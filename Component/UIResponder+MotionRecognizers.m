
//  Created by Yang Meyer on 03.02.12.
//  Copyright (c) 2012 compeople. All rights reserved.

#import "UIResponder+MotionRecognizers.h"

@implementation UIResponder (MotionRecognizers)

- (void) addMotionRecognizerWithAction:(SEL)action {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:action name:@"CPDeviceShaken" object:nil];
}

- (void) removeMotionRecognizer {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"CPDeviceShaken" object:nil];
}

@end
