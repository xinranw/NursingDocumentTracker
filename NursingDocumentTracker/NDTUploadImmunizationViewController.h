//
//  NDTUploadDocumentViewController.h
//  NursingDocumentTracker
//
//  Created by User on 4/5/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDTUploadImmunizationViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *titleField;
    IBOutlet UITextField *dateField;
}

- (IBAction) uploadImage;


@end
