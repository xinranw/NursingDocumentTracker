//
//  XIWFirstViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/22/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "XIWFirstViewController.h"
#import "Users.h"

@interface XIWFirstViewController ()

-(IBAction)gotoRegister:(id)sender;

@property (strong) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic,strong) XIWDataManager *myDataManager;
@property (nonatomic,strong) NSArray *allUsers;

@end

@implementation XIWFirstViewController

- (XIWDataManager *)myDataManager
{
    if (!_myDataManager) {
        _myDataManager = [[XIWDataManager alloc] init];
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
    
    NSLog(@"%d",[_userDictionary count]);
    //password is correct
    if([[_userDictionary objectForKey:_usernameField.text]isEqualToString:_passwordField.text]) {
       // [self performSegueWithIdentifier:@"login" sender:self];
    }
    //password is incorrect
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"Please check your username and password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [self dismissModalViewControllerAnimated:NO];

        return;
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
