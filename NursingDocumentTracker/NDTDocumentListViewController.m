//
//  NDTDocumentListViewController.m
//  NursingDocumentTracker
//
//  Created by Christian Barcenas on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTDocumentListViewController.h"

@implementation NDTDocumentListViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.parseClassName = @"UserPhoto";
        NSLog(@"%@", @"title");
        self.textKey = @"title";
        self.imageKey = @"imageFile";
        self.pullToRefreshEnabled = NO;
        self.paginationEnabled = YES;
        self.objectsPerPage = 25;
    }
    return self;
}


@end
