//
//  NDTUploadResumeViewController.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDTUploadResumeViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *titleField;
    IBOutlet UITextField *dateField;
}

- (IBAction) uploadImage;

@end
