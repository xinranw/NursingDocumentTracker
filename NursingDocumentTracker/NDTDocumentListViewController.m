//
//  NDTDocumentListViewController.m
//  NursingDocumentTracker
//
//  Created by Christian Barcenas on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTDocumentListViewController.h"
#import "NDTDocumentImageViewController.h"

@implementation NDTDocumentListViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.parseClassName = @"UserPhoto";
        self.textKey = @"imageName";
        self.imageKey = @"imageFile";
        self.pullToRefreshEnabled = NO;
        self.paginationEnabled = YES;
        self.objectsPerPage = 25;
    }
    return self;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    
        NDTDocumentImageViewController *documentImage =
        [[NDTDocumentImageViewController alloc] init];
    
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        documentImage.pfobject = object;
    
    
        [self.navigationController pushViewController:documentImage animated:YES];
}



@end
