//
//  NDTUploadViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/31/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTTakeImageViewController.h"
#import "NDTUploadController.h"

@interface NDTTakeImageViewController ()

@property (strong, nonatomic) NDTUploadController *uploadController;

@end

@implementation NDTTakeImageViewController

@synthesize imageView;

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
    self.nextButton.enabled = false;
    [self loadCamera];
}

- (NDTUploadController *) uploadController;
{
    if (!_uploadController){
        _uploadController = (NDTUploadController *) self.navigationController;
    }
    return _uploadController;
}

- (void) loadCamera
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // Checks if camera is accessible. Sets imagePicker to camera or photo library
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion: nil];
    
}

// Automatically called after an image is selected
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.nextButton.enabled = false;
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageView setImage:image];
    [_uploadController setDocumentImage:image];
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
