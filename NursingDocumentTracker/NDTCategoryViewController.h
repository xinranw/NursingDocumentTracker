//
//  NDTCategoryViewController.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/1/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDTCategoryViewController : UIViewController <UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic,weak) IBOutlet UIPickerView *picker;
@property (nonatomic,strong) IBOutlet UIBarButtonItem *nextButton;

- (IBAction) chooseController;

@end
