//
//  NDTSignUpViewController.m
//  NursingDocumentTracker
//
//  Created by Christian Barcenas on 5/5/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTSignUpViewController.h"

@interface NDTSignUpViewController ()

@end

@implementation NDTSignUpViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set background
    self.signUpView.backgroundColor = [UIColor whiteColor];
    
    // Set Logo
    self.signUpView.logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"signup-logo.png"]];
    
    // Remove text shadow
    CALayer *layer = self.signUpView.usernameField.layer;
    layer.shadowOpacity = 0.0;
    layer = self.signUpView.passwordField.layer;
    layer.shadowOpacity = 0.0;
    
    // Set field text color
    [self.signUpView.usernameField setTextColor:[UIColor blackColor]];
    [self.signUpView.passwordField setTextColor:[UIColor blackColor]];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // Fix frames of customized elements
    self.signUpView.logo.frame = CGRectMake(35.0f, 135.0f, 250.0f, 115.0f);
}


@end
