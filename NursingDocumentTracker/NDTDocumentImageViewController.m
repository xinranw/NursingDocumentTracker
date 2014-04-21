//
//  NDTDocumentImageViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 4/20/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTDocumentImageViewController.h"

@interface NDTDocumentImageViewController ()

@end

@implementation NDTDocumentImageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PFImageView* detImage = [[PFImageView alloc] initWithFrame:CGRectMake(0,50,350,480)];
    
    PFFile* file = [_pfobject objectForKey:@"imageFile"];
    
    detImage.file = file;
    
    [detImage loadInBackground];
    
    [self.view addSubview:detImage];
    

}


@end
