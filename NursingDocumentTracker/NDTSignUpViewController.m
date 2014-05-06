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
    
    
    // Size differently for iPhone < 5 screen
    if([UIScreen mainScreen].bounds.size.height == 568){
        self.signUpView.logo.frame = CGRectMake(35.0f, 135.0f, 250.0f, 115.0f);
    } else{
        NSLog(@"3.5 inch screen detected.");
        
        self.signUpView.logo.frame = CGRectMake(35.0f, 85.0f, 250.0f, 115.0f);
        
        CGPoint usernameFieldOrigin = self.signUpView.usernameField.frame.origin;
        CGSize usernameFieldSize = self.signUpView.usernameField.frame.size;
        [self.signUpView.usernameField setFrame:CGRectMake(usernameFieldOrigin.x, usernameFieldOrigin.y + 15.0f, usernameFieldSize.width, usernameFieldSize.height)];
        
        CGPoint passwordFieldOrigin = self.signUpView.passwordField.frame.origin;
        CGSize passwordFieldSize = self.signUpView.passwordField.frame.size;
        [self.signUpView.passwordField setFrame:CGRectMake(passwordFieldOrigin.x, passwordFieldOrigin.y + 15.0f, passwordFieldSize.width, passwordFieldSize.height)];
        
        CGPoint signUpButtonOrigin = self.signUpView.signUpButton.frame.origin;
        CGSize signUpButtonSize = self.signUpView.signUpButton.frame.size;
        [self.signUpView.signUpButton setFrame:CGRectMake(signUpButtonOrigin.x, signUpButtonOrigin.y + 25.0f, signUpButtonSize.width, signUpButtonSize.height)];
    }
}


@end
