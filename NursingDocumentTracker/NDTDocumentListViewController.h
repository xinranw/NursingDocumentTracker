//
//  NDTDocumentListViewController.h
//  NursingDocumentTracker
//
//  Created by Christian Barcenas on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/PFQueryTableViewController.h>
#import "NDTDocumentCategory.h"

@interface NDTDocumentListViewController : PFQueryTableViewController

@property NDTDocumentCategory category;

@end
