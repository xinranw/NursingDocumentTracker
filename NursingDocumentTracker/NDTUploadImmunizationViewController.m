//
//  NDTUploadImmunizationViewController.m
//  NursingDocumentTracker
//
//  Created by User on 4/5/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTUploadImmunizationViewController.h"
#import "NDTUploadController.h"

@interface NDTUploadImmunizationViewController ()

- (void) pickerChanged:(id)sender;

@property (nonatomic,strong) NSDate *expirationDate;
@property (strong, nonatomic) NDTUploadController *uploadController;

@end

@implementation NDTUploadImmunizationViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _uploadController = (NDTUploadController *) self.navigationController;
	// Do any additional setup after loading the view.
    UIDatePicker *myDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    //whenever value changes, go to this method
    [myDatePicker addTarget:self
                     action:@selector(pickerChanged:)
           forControlEvents:UIControlEventValueChanged];
    myDatePicker.minimumDate = [NSDate date];
    
    dateField.inputView = myDatePicker;
    
    titleField.delegate = self;
    dateField.delegate = self;
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
        titleField.text = @"ImmunizationDoc1";
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

@end
