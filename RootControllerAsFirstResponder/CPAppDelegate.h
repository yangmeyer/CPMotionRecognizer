//
//  CPAppDelegate.h
//  RootControllerAsFirstResponder
//
//  Created by Yang Meyer on 30.01.12.
//  Copyright (c) 2012 compeople. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPViewController;

@interface CPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CPViewController *viewController;

@end
