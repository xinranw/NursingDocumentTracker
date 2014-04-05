//
//  NDTUploadController.h
//  NursingDocumentTracker
//
//  Created by User on 4/4/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"
#import "NDTDocument.h"


@interface NDTUploadController : UINavigationController <MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
    MBProgressHUD *refreshHUD;
}

@property (strong, nonatomic) NDTDocument *document;

- (void) setDocumentImage: (UIImage *)image;
@end
