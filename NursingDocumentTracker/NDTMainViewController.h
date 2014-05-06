//
//  NDTMainViewController.h
//  NursingDocumentTracker
//
//  Created by User on 3/21/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDTMainViewController : UITabBarController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

- (void)presentLogInViewController;

// FOR UNIT TESTING PURPOSES:
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password;

@end
