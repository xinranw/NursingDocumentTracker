//
//  XIWFirstViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/22/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "XIWFirstViewController.h"

@interface XIWFirstViewController ()

-(IBAction)gotoRegister:(id)sender;

@end

@implementation XIWFirstViewController

-(IBAction)login:(id)sender
{
    //password is correct
    if([[_userDictionary objectForKey:_usernameField.text]isEqualToString:_passwordField.text]) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
    //password is incorrect
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"Please check your username and password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

-(IBAction)gotoRegister:(id)sender
{
    [self performSegueWithIdentifier:@"register" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _userDictionary = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"password", nil] forKeys:[NSArray arrayWithObjects:@"username", nil]];
}

@end
