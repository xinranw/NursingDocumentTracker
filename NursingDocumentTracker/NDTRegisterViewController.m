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
    // Is form not empty?
    if (![self isFormFilled]) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Field"
                                    message:@"You are missing a field"
                                    delegate:nil
                            cancelButtonTitle:@"Ok"
                             otherButtonTitles:nil, nil] show];
        return;
    }
    
    // Does inputted password match confirmation?
    if (![passwordField.text isEqualToString:confirmedField.text]) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                   message:@"The passwords you typed were not the same"
                                  delegate:nil
                         cancelButtonTitle:@"Ok"
                         otherButtonTitles:nil, nil] show];
        return;
    }

    // Create user and populate user/pass fields
    NDTUser *newUser = [[NDTUser alloc] init];
    newUser.username =
        [usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    newUser.password =
        [passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
    NDTDataManager *myDataManager = [[NDTDataManager alloc] init];
    // Unable to add user?
    if (![myDataManager addUserWithData:newUser]) {
        [[[UIAlertView alloc] initWithTitle:@"Registration Error"
                                   message:@"An account with the same username already exists. Please select a different username."
                                  delegate:nil
                         cancelButtonTitle:@"Ok"
                         otherButtonTitles:nil, nil] show];
        return;
    }
    
    // We've successfully created our user!
    [[[UIAlertView alloc] initWithTitle:@"Success"
                                message:@"Account successfully registered."
                               delegate:nil
                      cancelButtonTitle:@"Back to login"
                      otherButtonTitles:nil, nil] show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)isFormFilled
{
    return !([usernameField.text isEqualToString:@""] ||
             [emailField.text isEqualToString:@""]    ||
             [passwordField.text isEqualToString:@""] ||
             [confirmedField.text isEqualToString:@""]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
