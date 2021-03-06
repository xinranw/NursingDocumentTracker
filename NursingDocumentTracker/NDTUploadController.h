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
@property (strong, nonatomic) UIBarButtonItem *testButton;

- (void) setDocumentImage: (UIImage *)image;
- (void) setDocumentCategory: (NDTDocumentCategory *) category;
- (void) uploadDocument: (NSString *) imageName withCategory: (NDTDocumentCategory) categoryName;
- (void) addDocumentPropertyWithKey: (NSString *)key AndValue: (NSData *) value;
- (NSDate *) dateOneYearFromNow;
+ (NSString *) documentCategoryToString:(NDTDocumentCategory) category;

@end
