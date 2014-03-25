//
//  Users.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/23/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NDTUser : NSObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * password;

@end
