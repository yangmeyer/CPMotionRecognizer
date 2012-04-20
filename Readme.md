
Handle device shakes just like touch gestures: `[self addMotionRecognizerWithAction:@selector(shakeWasRecognized:)];`

Usage
-------
### Set it up once …
In you app delegate, instantiate the motion-detecting UIWindow subclass:

	self.window = [[CPMotionRecognizingWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

### … then use like this
Wherever you want handle shakes, add the “motion recognizer”:

	[self addMotionRecognizerWithAction:@selector(shakeWasRecognized:)];
	
and implement the callback:

	- (void) shakeWasRecognized:(NSNotification*)notif;

When you’re done:

	[self removeMotionRecognizer];

Why?
------
Although we got the shake to be properly recognized by simply implementing `-canBecomeFirstResponder` and `-motionEnded:withEvent:`, when we presented a modal view controller its text fields did no longer become first responder, making the modal UI unusable.

So we tried out different approaches and came up with CPMotionRecognizer, because we think it’s nicer to treat the shake gesture much like we treat touch gestures (since iOS 3.2 anyway).

### What we tried first

Apple’s [Event Handling Guide for iOS](http://developer.apple.com/library/ios/#documentation/EventHandling/Conceptual/EventHandlingiPhoneOS/MotionEvents/MotionEvents.html) states that “To receive motion events, the responder object that is to handle them must be the first responder.” So we do this in our root view controller:

	- (BOOL) canBecomeFirstResponder {
		return YES;
	}

	- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
		if (event.subtype == UIEventSubtypeMotionShake) {
			[self.currentViewController shakeWasRecognized];
		}
		[super motionEnded:motion withEvent:event];
	}

Problem is, when we present a modal view controller on top, the root view controller does not let go of its cherished first-responder status automatically.

### Quick work-around

OK then, `[theRootViewController resignFirstResponder]` does the trick. But this is fragile because we – and more importantly, future maintainers of our code as well as our future selves – need to remember to do this every time we present a modal view controller. Not good.

### How CPMotionRecognizer works

The excellent [Cocoa Application Competencies for iOS](https://developer.apple.com/library/ios/#documentation/general/conceptual/Devpedia-CocoaApp/Responder.html) guide on Responder objects describes that the “shake” motion event travels up the responder chain all the way to the UIWindow and finally to the UIApplication.

CPMotionRecognizer intercepts the motion events at the UIWindow level, with a custom sublass `CPMotionRecognizingWindow`, which you need to instantiate in your app delegate.

When a motion event occurs and no previous object in the responder chain consumes it, it lands in this subclassed UIWindow instance, which then posts an NSNotification.

In your UIResponder object (say, a UIViewController) calling `[self addMotionRecognizerWithAction:@selector(myAction:)]` starts observing the motion-recognized notification. When it gets posted, `-myAction:` is invoked on your responder.
	
ARC
------------
CPMotionRecognizer was built with [Automatic Reference Counting](http://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/_index.html). If you aren’t using ARC in your project (you really, really should though), make sure to specify the `-fobjc-arc` flag on this component’s files in Build phases > Compile sources.

License
-------
The CPMotionRecognizer component is released under the MIT License (see [License.md](https://github.com/yangmeyer/CPMotionRecognizer/blob/master/License.md)).

Attribution is not required but it is good form. Feel free to comment, fork, and submit pull requests!

Copyright (c) 2012 compeople AG.