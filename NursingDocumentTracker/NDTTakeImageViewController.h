//
//  NDTUploadViewController.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/31/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDTTakeImageViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,weak) IBOutlet UIImageView *imageView; 
@property (nonatomic,strong) IBOutlet UIBarButtonItem *nextButton;


@end
