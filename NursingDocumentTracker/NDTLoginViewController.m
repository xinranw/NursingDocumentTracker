//
//  NDTFirstViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/22/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTLoginViewController.h"
#import "NDTUser.h"

@interface NDTLoginViewController ()

-(IBAction)gotoRegister:(id)sender;

@property (strong) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic,strong) NDTDataManager *myDataManager;
@property (nonatomic,strong) NSArray *allUsers;

@end

@implementation NDTLoginViewController

- (NDTDataManager *)myDataManager
{
    if (!_myDataManager) {
        _myDataManager = [[NDTDataManager alloc] init];
    }
    return _myDataManager;
}

- (NSArray *)allUsers
{
    if (!_allUsers) {
        _allUsers = [self.myDataManager allUsers];
    }
    return _allUsers;
}

-(IBAction)login:(id)sender
{
    for (NDTUser *user in [self allUsers]) {
        if ([user.username isEqualToString:_usernameField.text] &&
            [user.password isEqualToString:_passwordField.text]) {
            // Successful login
            [self performSegueWithIdentifier:@"login" sender:self];
            _usernameField.text = @"";
            _passwordField.text = @"";
            return;
        }
    }

    // If we've reached this point, invalid login
    [[[UIAlertView alloc] initWithTitle:@"Incorrect Password"
                               message:@"Please check your username and password"
                              delegate:self
                     cancelButtonTitle:@"Ok"
                     otherButtonTitles:nil] show];
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
    [_usernameField resignFirstResponder];
    [_passwordField resignFirstResponder];

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
-(IBAction)gotoRegister:(id)sender
{
    [self performSegueWithIdentifier:@"register" sender:self];
}


@end
