//
//  AppDelegate.m
//  vfl-sample
//
//  Created by Alécio José Gomes Neto on 26/05/15.
//  Copyright (c) 2015 CocoaHeads. All rights reserved.
//

#import "AppDelegate.h"
#import "SimpleViewController.h"
#import "FormViewController.h"
#import "MiscViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [[UINavigationBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setTranslucent:NO];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[[SimpleViewController new],
                                         [[UINavigationController alloc] initWithRootViewController:[FormViewController new]],
                                         [MiscViewController new]];

    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
