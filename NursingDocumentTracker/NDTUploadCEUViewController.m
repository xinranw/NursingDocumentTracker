//
//  NDTUploadCEUViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTUploadCEUViewController.h"
#import "NDTUploadController.h"

@interface NDTUploadCEUViewController ()

@property (nonatomic,retain) UIToolbar *keyboardToolbar;
@property (nonatomic,retain) UIBarButtonItem *previousButton;
@property (strong, nonatomic) NDTUploadController *uploadController;
@property (nonatomic, strong) NSDate *date;

-(void)previousField:(id)sender;
-(void)nextField:(id)sender;
-(void)setupKeyboard:(id)sender;
-(void)resignKeyboard:(id)sender;
-(void) pickerChanged:(id)sender;

@end

@implementation NDTUploadCEUViewController


-(void)previousField:(id)sender
{
    if ([dateField isFirstResponder]) {
        [titleField becomeFirstResponder];
    }
    else if ([providerField isFirstResponder]) {
        [dateField becomeFirstResponder];
    }
    else if ([numberField isFirstResponder]) {
        [providerField becomeFirstResponder];
    }
}
-(void)nextField:(id)sender
{
    if ([titleField isFirstResponder]) {
        [dateField becomeFirstResponder];
    }
    else if ([dateField isFirstResponder]) {
        [providerField becomeFirstResponder];
    }
    else if ([providerField isFirstResponder]) {
        [numberField becomeFirstResponder];
    }
}
-(void)setupKeyboard:(id)sender
{
    if (self.keyboardToolbar == nil) {
        self.keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        _previousButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous"
                                                           style:UIBarButtonItemStyleBordered
                                                          target:self
                                                          action:@selector(previousField:)];
        UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                       style:UIBarButtonItemStyleBordered
                                                                      target:self
                                                                      action:@selector(nextField:)];
        UIBarButtonItem *extraSpace = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                       target:self
                                       action:nil];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleDone
                                                                      target:self
                                                                      action:@selector(resignKeyboard:)];
        [self.keyboardToolbar setItems:[[NSArray alloc] initWithObjects:_previousButton, nextButton,extraSpace, doneButton, nil]];
    }
}
-(void)resignKeyboard:(id)sender
{
    [titleField resignFirstResponder];
    [dateField resignFirstResponder];
    [providerField resignFirstResponder];
    [numberField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupKeyboard:self];
    
    UIDatePicker *myDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    //whenever value changes, go to this method
    [myDatePicker addTarget:self
                     action:@selector(pickerChanged:)
           forControlEvents:UIControlEventValueChanged];
    myDatePicker.minimumDate = [NSDate date];
    
    titleField.inputAccessoryView = self.keyboardToolbar;
    dateField.inputAccessoryView = self.keyboardToolbar;
    providerField.inputAccessoryView = self.keyboardToolbar;
    numberField.inputAccessoryView = self.keyboardToolbar;
    dateField.inputView = myDatePicker;
    
    for (id subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[UITextField class]]) {
            [subView setDelegate:self];
        }
    }
    
}

- (void) pickerChanged:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd yyyy"];
    
    dateField.text = [dateFormatter stringFromDate:[sender date]];
    
    _date = [sender date];
    NSLog(@"value: %@", [sender date]);
    
}


- (void) textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    
    viewFrame.origin.y = 0;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:.4];
    
    [textField resignFirstResponder];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //get reference to current frame
    CGRect viewFrame = self.view.frame;
    NSLog(@"here %@", textField);
    
    //always enable previous
    if (titleField == textField) {
        //disable the previous button
    }
    
    //check to see what frame is begin edited right now
    if (providerField == textField) {
        viewFrame.origin.y -= 60;
    }
    else if (numberField == textField) {
        viewFrame.origin.y -= 160;
    }
    
    //do animations on this view
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:.4];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (IBAction) uploadImage
{
    [_uploadController addDocumentPropertyWithKey:@"title" AndValue:(NSData *)titleField.text];
    [_uploadController addDocumentPropertyWithKey:@"date" AndValue:(NSData *)_date];
    [_uploadController addDocumentPropertyWithKey:@"provider" AndValue:(NSData *) providerField.text];
    [_uploadController addDocumentPropertyWithKey:@"number" AndValue:(NSData *) numberField.text];
    _uploadController.uploadDocument;
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
