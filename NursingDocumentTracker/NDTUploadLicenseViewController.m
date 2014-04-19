//
//  NDTUploadLicenseViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/7/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTUploadLicenseViewController.h"
#import "NDTUploadController.h"

@interface NDTUploadLicenseViewController ()

- (void) pickerChanged:(id)sender;
@property (nonatomic,strong) NSDate *expirationDate;
@property (strong, nonatomic) NDTUploadController *uploadController;

@end

@implementation NDTUploadLicenseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _uploadController = (NDTUploadController *) self.navigationController;
	// Do any additional setup after loading the view.
    UIDatePicker *myDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    //whenever value changes, go to this method
    [myDatePicker addTarget:self
                     action:@selector(pickerChanged:)
           forControlEvents:UIControlEventValueChanged];
    myDatePicker.minimumDate = [NSDate date];
    
    dateField.inputView = myDatePicker;

    dateField.delegate = self;
    titleField.delegate = self;
}

- (void) pickerChanged:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd yyyy"];
    
    dateField.text = [dateFormatter stringFromDate:[sender date]];
    
    _expirationDate = [sender date];
    NSLog(@"value: %@", [sender date]);
    
}

- (IBAction) uploadImage
{
    if ([titleField.text isEqualToString: @""]) {
        titleField.text = @"LicenseDoc1";
    }
    if ([dateField.text isEqualToString: @""]) {
        _expirationDate = [_uploadController dateOneYearFromNow];
    }
    
    [_uploadController addDocumentPropertyWithKey:@"title" AndValue:(NSData *)titleField.text];
    [_uploadController addDocumentPropertyWithKey:@"expiration" AndValue:(NSData *)_expirationDate];

    [_uploadController uploadDocument:titleField.text];    
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
