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
    UIButton *licensesButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 150, 100, 30)];
    [licensesButton setTitle:@"Licenses" forState:UIControlStateNormal];
    [licensesButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    UIButton *certificationsButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 200, 100, 30)];
    [certificationsButton setTitle:@"Certifications" forState:UIControlStateNormal];
    [certificationsButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    UIButton *ceusButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 250, 100, 30)];
    [ceusButton setTitle:@"CEUs" forState:UIControlStateNormal];
    [ceusButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    UIButton *resumesButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 100, 30)];
    [resumesButton setTitle:@"CV/Resume" forState:UIControlStateNormal];
    [resumesButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    UIButton *othersButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 350, 100, 30)];
    [othersButton setTitle:@"Others" forState:UIControlStateNormal];
    [othersButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    NSArray *buttons = [[NSArray alloc] initWithObjects: immunizationsButton, licensesButton, certificationsButton, ceusButton, resumesButton, othersButton, nil];
    
    
    UIButton *button;
    for (int i = 0; i < buttons.count; i++){
        button = (UIButton *)[buttons objectAtIndex:i];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [button setBackgroundColor: [UIColor yellowColor]];
        [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14]];

        [button setTag: i];
        [self.view addSubview:button];
    }
}

-(void) buttonClicked:(id)sender
{
    NSLog(@"you clicked on button %@", sender);
//    [self performSegueWithIdentifier:@"CategoryListingSegue" sender:self];
    
    NDTDocumentListViewController *documentList =
        [[NDTDocumentListViewController alloc] init];
    
    [self.navigationController pushViewController:documentList animated:YES];
}

- (IBAction)logoutButtonTapAction:(id)sender
{
    [PFUser logOut];
    [(NDTMainViewController*)self.tabBarController presentLogInViewController];
}

@end
