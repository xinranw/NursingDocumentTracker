//
//  NDTCategoryViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/1/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTCategoryViewController.h"
#import "NDTUploadController.h"

@interface NDTCategoryViewController ()

@property (strong, nonatomic) NDTUploadController *uploadController;
@property (strong, nonatomic) NSArray *categoryArray;

@end

@implementation NDTCategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _uploadController = (NDTUploadController *) self.navigationController;
    self.nextButton.enabled = false;
    [self setupUIPicker];
}

- (void) setupUIPicker
{
    _categoryArray = [[NSArray alloc] initWithObjects:@"Immunizations", @"Licenses", @"Certifications", @"CEUs", @"CV/Resume", @"Other", nil];
    _picker.delegate = self;
    _picker.dataSource = self;
    
    [self.picker reloadAllComponents];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;//Or return whatever as you intend
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_categoryArray count];//Or, return as suitable for you...normally we use array for dynamic
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_categoryArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    
//    //Here, like the table view you can get the each section of each row if you've multiple sections
//    NSLog(@"Selected Color: %@. Index of selected color: %i", [arrayColors objectAtIndex:row], row);
    
//    //Now, if you want to navigate then;
//    // Say, OtherViewController is the controller, where you want to navigate:
//    OtherViewController *objOtherViewController = [OtherViewController new];
//    [self.navigationController pushViewController:objOtherViewController animated:YES];
    
    self.nextButton.enabled = true;
    [_uploadController setDocumentCategory:(NDTDocumentCategory *)row];
    NSLog(@"%d", (int) _uploadController.document.category);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
