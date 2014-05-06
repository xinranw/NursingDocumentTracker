//
//  NDTUploadResumeViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTUploadResumeViewController.h"
#import "NDTUploadController.h"

@interface NDTUploadResumeViewController ()

@property (strong, nonatomic) NDTUploadController *uploadController;
@property (nonatomic,strong) NSDate *date;

@end

@implementation NDTUploadResumeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _uploadController = (NDTUploadController *) self.navigationController;
	UIDatePicker *myDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    
    //whenever value changes, go to this method
    [myDatePicker addTarget:self
                     action:@selector(pickerChanged:)
           forControlEvents:UIControlEventValueChanged];
    myDatePicker.minimumDate = [NSDate date];
    
    dateField.inputView = myDatePicker;
    
    titleField.delegate = self;
    dateField.delegate = self;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
}

- (void) pickerChanged:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd yyyy"];
    
    dateField.text = [dateFormatter stringFromDate:[sender date]];
    
    _date = [sender date];
    NSLog(@"value: %@", [sender date]);
    
}

- (IBAction) uploadImage
{
    if ([titleField.text isEqualToString: @""]) {
        titleField.text = @"ResumeDoc1";
    }
    if ([dateField.text isEqualToString: @""]) {
        _date = [NSDate date];
    }
    
    [_uploadController addDocumentPropertyWithKey:@"title" AndValue:(NSData *)titleField.text];
    [_uploadController addDocumentPropertyWithKey:@"date" AndValue:(NSData *)_date];

    [_uploadController uploadDocument:titleField.text withCategory:CategoryResumes];
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
