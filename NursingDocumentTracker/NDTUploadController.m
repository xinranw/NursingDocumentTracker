//
//  NDTUploadController.m
//  NursingDocumentTracker
//
//  Created by User on 4/4/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTUploadController.h"

@interface NDTUploadController ()

@end

@implementation NDTUploadController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NDTDocument *) document
{
    if (!_document){
        (void) [_document init];
    }

    return _document;
}

- (void) setDocumentImage: (UIImage *)image;
{
    NSLog(@"setting document image");
    _document = [[NDTDocument alloc] initWithImage:image];
}

- (void) addDocumentPropertyWithKey: (NSString *)key AndValue: (NSData *) value
{
    [_document addPropertyWithKey:key AndValue:value];
}

- (void) setDocumentCategory: (NDTDocumentCategory *)category
{
    _document.category = category;
}

- (void) uploadDocument: (NSString *) imageName withCategory: (NDTDocumentCategory) categoryName
{
    NSLog(@"uploading document!")
    
    NSData *imageData = UIImageJPEGRepresentation(_document.image, 0.05f);
    PFFile *imageFile = [PFFile fileWithName:[NSString stringWithFormat:@"%@.jpg", imageName] data:imageData];
    
    NSLog(@"image files created in memory")
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    // Set determinate mode
    HUD.mode = MBProgressHUDModeDeterminate;
    HUD.delegate = self;
    HUD.labelText = @"Uploading";
    [HUD show:YES];
    
    NSLog(@"hud shown, now uploading dat PFFile")
    
    // Save PFFile
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //Hide determinate HUD
            [HUD hide:YES];
            
            // Show checkmark
            HUD = [[MBProgressHUD alloc] initWithView:self.view];
            [self.view addSubview:HUD];
            
            // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
            HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
            
            // Set custom view mode
            HUD.mode = MBProgressHUDModeCustomView;
            
            HUD.delegate = self;
            
            // Create a PFObject around a PFFile and associate it with the current user
            PFObject *userPhoto = [PFObject objectWithClassName:[NDTUploadController documentCategoryToString:categoryName]];
            userPhoto[@"imageFile"] = imageFile;
            userPhoto[@"imageName"] = imageName;
            
            // test if category is nil?
            NSLog(@"%@", [NDTUploadController documentCategoryToString:categoryName]);
            
            // Set the access control list to current user for security purposes
            userPhoto.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
            PFUser *user = [PFUser currentUser];
            [userPhoto setObject:user forKey:@"user"];
            
            [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    NSLog(@"uploaded!");
//                    [self refresh:nil];
                }
                else{
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
        else{
            [HUD hide:YES];
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    } progressBlock:^(int percentDone) {
        // Update your progress spinner here. percentDone will be between 0 and 100.
        HUD.progress = (float)percentDone/100;
    }];
}

+ (NSString *) documentCategoryToString:(NDTDocumentCategory) category
{
    NSString *result = @"";
    
    switch (category) {
        case CategoryImmunizations:
            result = @"Immunization";
            break;
        case CategoryLicenses:
            result = @"License";
            break;
        case CategoryCertifications:
            result = @"Certification";
            break;
        case CategoryCEUs:
            result = @"CEU";
            break;
        case CategoryResumes:
            result = @"Resume";
            break;
        default:
            result = @"Other";
            break;
    }
    return result;
}

// why is it so much work to just get the date one year from now?
- (NSDate *) dateOneYearFromNow
{
    NSDate *currentDate = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:1];
    return [gregorian dateByAddingComponents:comps toDate:currentDate  options:0];
}

- (NSString *) description
{
    return @"This is an upload controller.";
}




@end
