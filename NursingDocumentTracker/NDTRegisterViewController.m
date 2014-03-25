//
//  NDTRegisterViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/22/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTRegisterViewController.h"
#import "NDTDataManager.h"

@interface NDTRegisterViewController ()

-(IBAction)dismissModal:(id)sender;
-(void)resignKeyboard:(id)sender;

@property (strong) UITapGestureRecognizer *tapRecognizer;



@end

@implementation NDTRegisterViewController

-(IBAction)dismissModal:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void) keyboardWillShow : (NSNotification *)note
{
    [self.view addGestureRecognizer:_tapRecognizer];
}

- (void) keyboardWillHide : (NSNotification *)note
{
    [self.view removeGestureRecognizer:_tapRecognizer];
}

- (void) didTapAnywhere : (UITapGestureRecognizer *) recognizer
{
    [self resignKeyboard:self];
}

- (void) resignKeyboard:(id)sender
{
    [usernameField resignFirstResponder];
    [confirmedField resignFirstResponder];
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Tap recognizer to dismiss keyboard
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
    
}


-(IBAction)registerUser:(id)sender
{
    //check to see if any fields are empty
    if ([usernameField.text isEqualToString:@""]
        || [emailField.text isEqualToString:@""]
        || [passwordField.text isEqualToString:@""]
        || [confirmedField.text isEqualToString:@""]) {
        UIAlertView *missingFields = [[UIAlertView alloc] initWithTitle:@"Missing Field" message:@"You are missing a field" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [missingFields show];
    }
    else if (![passwordField.text isEqualToString:confirmedField.text]) {
        UIAlertView *differentPassword = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The passwords you typed were not the same" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [differentPassword show];
    }
    else {
        //perform user registration
        
        NDTUser *newUser = [[NDTUser alloc] init];
        newUser.username = usernameField.text;
        newUser.password = passwordField.text;
        
        NDTDataManager *myDataManager = [[NDTDataManager alloc] init];
        if ([myDataManager addUserWithData:newUser]) {
            NSLog(@"SUCCESS");
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else {
            UIAlertView *missingFields = [[UIAlertView alloc] initWithTitle:@"Hey" message:@"Something is Wrong" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [missingFields show];
        }

    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
