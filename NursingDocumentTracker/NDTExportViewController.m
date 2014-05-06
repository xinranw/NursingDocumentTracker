//
//  NDTExportViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 5/6/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTExportViewController.h"

@interface NDTExportViewController ()

@end

@implementation NDTExportViewController

- (IBAction)exportButton:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose from below"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Google Drive", @"Dropbox", nil];
    [actionSheet showInView:self.view];
    //slide back down
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
