//
//  KPAAppDelegate.m
//  KPAKitProject
//
//  Created by Kenneth Parker Ackerson on 5/19/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import "KPAAppDelegate.h"
#import "KPAMainViewController.h"

@implementation KPAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:[[KPAMainViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
