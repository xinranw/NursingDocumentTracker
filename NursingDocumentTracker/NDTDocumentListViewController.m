//
//  NDTDocumentListViewController.m
//  NursingDocumentTracker
//
//  Created by Christian Barcenas on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTDocumentListViewController.h"
#import "NDTDocumentImageViewController.h"

@interface NDTDocumentListViewController()

@end

@implementation NDTDocumentListViewController

//- (id)initWithCoder:(NSCoder *)aCoder {
//    self = [super initWithCoder:aCoder];
//    if (self) {
//        // Customize the table
//        
//        // The className to query on
//        self.parseClassName = @"UserPhoto";
//        
//        // The key of the PFObject to display in the label of the default cell style
//        self.textKey = @"text";
//        
//        // Uncomment the following line to specify the key of a PFFile on the PFObject to display in the imageView of the default cell style
//        // self.imageKey = @"image";
//        
//        // Whether the built-in pull-to-refresh is enabled
//        self.pullToRefreshEnabled = YES;
//        
//        // Whether the built-in pagination is enabled
//        self.paginationEnabled = YES;
//        
//        // The number of objects to show per page
//        self.objectsPerPage = 25;
//    }
//    return self;
//}

- (id) initWithClassName:(NSString *)aClassName
{
    self = [super init];
    if (self) {
        self.parseClassName = aClassName;
        self.textKey = @"imageName";
        self.imageKey = @"imageFile";
        self.pullToRefreshEnabled = NO;
        self.paginationEnabled = YES;
        self.objectsPerPage = 25;
    }
//    NSLog(@"INSIDE DLV, category #: %d", _category);
//    NSLog(@"INSIDE DLV, classname : %@", self.parseClassName);
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    NDTDocumentImageViewController *documentImage =
    [[NDTDocumentImageViewController alloc] init];
    
    PFObject *object = [self.objects objectAtIndex:indexPath.row];
    documentImage.pfobject = object;
    
    [self.navigationController pushViewController:documentImage animated:YES];
}


@end
