
//  Created by Yang Meyer on 03.02.12.
//  Copyright (c) 2012 compeople. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIResponder (MotionRecognizers)

/** Registers the receiver for future motion events.
	The `action` message will be sent to the receiver when a motion event occurs and is
	not intercepted in the responder chain. The `action` selector must take exactly one
	parameter of type NSNotification.
	You must not add a motion recognizer more than once.
*/
- (void) addMotionRecognizerWithAction:(SEL)action;

/** You must call this before deallocating the receiver. */
- (void) removeMotionRecognizer;

@end
