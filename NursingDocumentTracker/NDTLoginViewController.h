//
//  NDTFirstViewController.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/22/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDTDataManager.h"

@interface NDTLoginViewController : UIViewController

@property (nonatomic,strong) IBOutlet UITextField *usernameField;
@property (nonatomic,strong) IBOutlet UITextField *passwordField;
@property (nonatomic,strong) NSDictionary *userDictionary;

-(IBAction)login:(id)sender;

@end
