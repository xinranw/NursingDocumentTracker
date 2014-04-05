//
//  NDTPropertiesViewController.m
//  NursingDocumentTracker
//
//  Created by User on 4/4/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTPropertiesViewController.h"
#import "NDTUploadController.h"

@interface NDTPropertiesViewController ()

@property (strong, nonatomic) NDTUploadController *uploadController;

@end

@implementation NDTPropertiesViewController

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
    _uploadController = (NDTUploadController *) self.navigationController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) displayForm
{
    NDTDocumentCategory *category = _uploadController.document.category;
    switch ((int) category) {
        case CategoryImmunizations:
            break;
        case CategoryLicenses:
            break;
        case CategoryCertifications:
            break;
        case CategoryCEUs:
            break;
        case CategoryResumes:
            break;
        case CategoryOthers:
            break;
    }
}

@end
