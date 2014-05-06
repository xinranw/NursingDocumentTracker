//
//  NDTLogInViewController.m
//  NursingDocumentTracker
//
//  Created by Christian Barcenas on 4/6/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTLogInViewController.h"

@interface NDTLogInViewController ()

@end

@implementation NDTLogInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.logInView setBackgroundColor:[UIColor whiteColor]];

    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];
    
    // Add login field background
    //    UIImageView *fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    //    [self.logInView insertSubview:fieldsBackground atIndex:1];
    
    // Remove text shadow
    CALayer *layer = self.logInView.usernameField.layer;
    layer.shadowOpacity = 0.0;
    layer = self.logInView.passwordField.layer;
    layer.shadowOpacity = 0.0;
    self.logInView.signUpLabel.shadowColor = [UIColor clearColor];
    
    // Set field text color
    [self.logInView.usernameField setTextColor:[UIColor blackColor]];
    [self.logInView.passwordField setTextColor:[UIColor blackColor]];
    [self.logInView.signUpLabel setTextColor:[UIColor grayColor]];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // Size differently for iPhone < 5 screen
    if([UIScreen mainScreen].bounds.size.height == 568){
        [self.logInView.logo setFrame:CGRectMake(35.0f, 90.0f, 250.0f, 115.0f)];
    } else{
         NSLog(@"3.5 inch screen detected.");
        
        [self.logInView.logo setFrame:CGRectMake(35.0f, 40.0f, 250.0f, 115.0f)];
        
        CGPoint usernameFieldOrigin = self.logInView.usernameField.frame.origin;
        CGSize usernameFieldSize = self.logInView.usernameField.frame.size;
        [self.logInView.usernameField setFrame:CGRectMake(usernameFieldOrigin.x, usernameFieldOrigin.y + 50.0f, usernameFieldSize.width, usernameFieldSize.height)];
        
        CGPoint passwordFieldOrigin = self.logInView.passwordField.frame.origin;
        CGSize passwordFieldSize = self.logInView.passwordField.frame.size;
        [self.logInView.passwordField setFrame:CGRectMake(passwordFieldOrigin.x, passwordFieldOrigin.y + 50.0f, passwordFieldSize.width, passwordFieldSize.height)];
        
        CGPoint signUpLabelOrigin = self.logInView.signUpLabel.frame.origin;
        CGSize signUpLabelSize = self.logInView.signUpLabel.frame.size;
        [self.logInView.signUpLabel setFrame:CGRectMake(signUpLabelOrigin.x, signUpLabelOrigin.y + 50.0f, signUpLabelSize.width, signUpLabelSize.height)];
        
        CGPoint logInButtonOrigin = self.logInView.logInButton.frame.origin;
        CGSize logInButtonSize = self.logInView.logInButton.frame.size;
        [self.logInView.logInButton setFrame:CGRectMake(logInButtonOrigin.x, logInButtonOrigin.y + 50.0f, logInButtonSize.width, logInButtonSize.height)];
        
        CGPoint signUpButtonOrigin = self.logInView.signUpButton.frame.origin;
        CGSize signUpButtonSize = self.logInView.signUpButton.frame.size;
        [self.logInView.signUpButton setFrame:CGRectMake(signUpButtonOrigin.x, signUpButtonOrigin.y + 50.0f, signUpButtonSize.width, signUpButtonSize.height)];
    }
}

@end
