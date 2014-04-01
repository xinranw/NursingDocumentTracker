//
//  NDTAppDelegate.m
//  NursingDocumentTracker
//
//  Created by User on 3/21/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTAppDelegate.h"

@implementation NDTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // Parse API
    [Parse setApplicationId:@"IwDZdySCmz9sFWr2R5pxFCg8tM4pdsTFXyR4D11n"
                  clientKey:@"JLF0CsbzUPE1tlhDlb94Jdo1PW6AAv4OeSmHwPfC"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    return YES;
}


#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
