//
//  NDTUploadOtherViewController.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDTUploadOtherViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *titleField;
}

- (IBAction) uploadImage;



@end
