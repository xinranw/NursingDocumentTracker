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
    
    PFImageView* detImage = [[PFImageView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    
    PFFile* file = [_pfobject objectForKey:@"imageFile"];
    detImage.file = file;
    [detImage loadInBackground];
    
    
    UIScrollView* myScrollView = [[UIScrollView alloc] init];
    
    [myScrollView setScrollEnabled:YES];
    [myScrollView setUserInteractionEnabled:YES];
    [myScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    [myScrollView addSubview:detImage];
    self.view = myScrollView;


}


@end
