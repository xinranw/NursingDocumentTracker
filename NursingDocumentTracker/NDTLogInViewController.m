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
    
    // Fix frames of customized elements
    [self.logInView.logo setFrame:CGRectMake(35.0f, 90.0f, 250.0f, 115.0f)];
}

@end
