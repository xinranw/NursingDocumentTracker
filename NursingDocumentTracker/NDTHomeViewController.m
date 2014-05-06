//
//  NDTHomeViewController.m
//  NursingDocumentTracker
//
//  Created by User on 3/21/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTMainViewController.h"
#import "NDTHomeViewController.h"
#import "NDTDocumentListViewController.h"
#import "NDTUploadController.h"

@interface NDTHomeViewController ()

@end

@implementation NDTHomeViewController

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
    [self addFolderButtons];
}

- (void)addFolderButtons
{
    UIButton *immunizationsButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 100, 100, 30)];
    [immunizationsButton setTitle:@"Immunizations" forState:UIControlStateNormal];
    [immunizationsButton addTarget:self
               action:@selector(buttonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [immunizationsButton setTag:CategoryImmunizations];
    
    UIButton *licensesButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 150, 100, 30)];
    [licensesButton setTitle:@"Licenses" forState:UIControlStateNormal];
    [licensesButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    [licensesButton setTag:CategoryLicenses];
    
    UIButton *certificationsButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 200, 100, 30)];
    [certificationsButton setTitle:@"Certifications" forState:UIControlStateNormal];
    [certificationsButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    [certificationsButton setTag:CategoryCertifications];
    
    UIButton *ceusButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 250, 100, 30)];
    [ceusButton setTitle:@"CEUs" forState:UIControlStateNormal];
    [ceusButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    [ceusButton setTag:CategoryCEUs];
    
    UIButton *resumesButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 100, 30)];
    [resumesButton setTitle:@"CV/Resume" forState:UIControlStateNormal];
    [resumesButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];\
    [resumesButton setTag:CategoryResumes];
    
    UIButton *othersButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 350, 100, 30)];
    [othersButton setTitle:@"Others" forState:UIControlStateNormal];
    [othersButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    [othersButton setTag:CategoryOthers];
    
    NSArray *buttons = [[NSArray alloc] initWithObjects: immunizationsButton, licensesButton, certificationsButton, ceusButton, resumesButton, othersButton, nil];
    
    UIButton *button;
    for (int i = 0; i < buttons.count; i++) {
        button = (UIButton *)[buttons objectAtIndex:i];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [button setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:16]];
        [self.view addSubview:button];
    }
}

- (void) buttonClicked:(id)sender
{
//    NSLog(@"You clicked on button %@", [sender titleLabel].text);
    
    NDTDocumentListViewController *documentList =
    [[NDTDocumentListViewController alloc] initWithClassName:[NDTUploadController documentCategoryToString: [sender tag]]];
//    NSLog(@"Button category clicked: %d", documentList.category);
    
    [self.navigationController pushViewController:documentList animated:YES];
}

- (IBAction)logoutButtonTapAction:(id)sender
{
    [PFUser logOut];
    [(NDTMainViewController*)self.tabBarController presentLogInViewController];
}

@end
