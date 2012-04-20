//
//  main.m
//  RootControllerAsFirstResponder
//
//  Created by Yang Meyer on 30.01.12.
//  Copyright (c) 2012 compeople. All rights reserved.
//

#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif

#import <UIKit/UIKit.h>

#import "CPAppDelegate.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([CPAppDelegate class]));
	}
}
