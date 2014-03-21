//
//  XIWHomeViewController.m
//  NursingDocumentTracker
//
//  Created by User on 3/21/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "XIWHomeViewController.h"

@interface XIWHomeViewController ()

@end

@implementation XIWHomeViewController

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
    [self addFolderButtons];
}

- (void)addFolderButtons
{
    UIButton *immunizationsButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 80, 30)];
    [immunizationsButton setTitle:@"Immunizations" forState:UIControlStateNormal];
    [immunizationsButton addTarget:self
               action:@selector(buttonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    UIButton *licensesButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 100, 80, 30)];
    [licensesButton setTitle:@"Licenses" forState:UIControlStateNormal];
    [licensesButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    UIButton *certificationsButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 100, 80, 30)];
    [certificationsButton setTitle:@"Certifications" forState:UIControlStateNormal];
    [certificationsButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    UIButton *ceusButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, 80, 30)];
    [ceusButton setTitle:@"CEUs" forState:UIControlStateNormal];
    [ceusButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    UIButton *resumesButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 150, 80, 30)];
    [resumesButton setTitle:@"CV/Resume" forState:UIControlStateNormal];
    [resumesButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    UIButton *othersButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 150, 80, 30)];
    [othersButton setTitle:@"Others" forState:UIControlStateNormal];
    [othersButton addTarget:self
                            action:@selector(buttonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *buttons = [[NSArray alloc] initWithObjects: immunizationsButton, licensesButton, certificationsButton, ceusButton, resumesButton, othersButton, nil];
    
    
    UIButton *button;
    for (int i = 0; i < buttons.count; i++){
        button = (UIButton *)[buttons objectAtIndex:i];
        
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor: [UIColor yellowColor]];
        [button addTarget:self
                   action:@selector(buttonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10]];

        [button setTag: i];
        [self.view addSubview:button];
    }
}

-(void) buttonClicked:(id)sender
{
    NSLog(@"you clicked on button %@", sender);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
