//
//  AppDelegate.h
//  JavaScriptInAppTest
//
//  Created by Lee on 17/2/7.
//  Copyright (c) 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RootViewController *viewController;

@property (strong, nonatomic) UINavigationController *navgationController;

@end

