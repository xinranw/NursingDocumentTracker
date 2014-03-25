//
//  NDTRegisterViewController.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/22/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDTRegisterViewController : UIViewController <UIActionSheetDelegate,UITextFieldDelegate> {

IBOutlet UITextField *usernameField;
IBOutlet UITextField *emailField;
IBOutlet UITextField *passwordField;
IBOutlet UITextField *confirmedField;
    
}

//@property (nonatomic,strong) NSDictionary *userDictionary;
-(IBAction)dismissModal:(id)sender;
-(IBAction)registerUser:(id)sender;

@end
