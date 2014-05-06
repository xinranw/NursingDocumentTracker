//
//  NDTCalendarViewController.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 5/6/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTCalendarViewController.h"

@interface NDTCalendarViewController ()

@end

@implementation NDTCalendarViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"calendar-placeholder.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
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
