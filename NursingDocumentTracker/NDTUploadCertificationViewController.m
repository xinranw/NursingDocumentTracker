//
//  NDTUploadCertificationViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTUploadCertificationViewController.h"
#import "NDTUploadController.h"

@interface NDTUploadCertificationViewController ()

@property (strong, nonatomic) NDTUploadController *uploadController;

@end

@implementation NDTUploadCertificationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _uploadController = (NDTUploadController *) self.navigationController;
	titleField.delegate = self;
}

- (IBAction) uploadImage
{
    if ([titleField.text isEqualToString: @""]) {
        titleField.text = @"CertificationDoc1";
    }
    
    [_uploadController addDocumentPropertyWithKey:@"title" AndValue:(NSData *)titleField.text];

    [_uploadController uploadDocument:titleField.text withCategory:CategoryCertifications];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
