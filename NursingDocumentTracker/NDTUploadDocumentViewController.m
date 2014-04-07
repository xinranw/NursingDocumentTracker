//
//  NDTUploadDocumentViewController.m
//  NursingDocumentTracker
//
//  Created by User on 4/5/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTUploadDocumentViewController.h"
#import "NDTUploadController.h"

@interface NDTUploadDocumentViewController ()

@property (strong, nonatomic) NDTUploadController *uploadController;


@end

@implementation NDTUploadDocumentViewController

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
    _uploadController = (NDTUploadController *) self.navigationController;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) uploadImage{
    _uploadController.uploadDocument;
}

@end
