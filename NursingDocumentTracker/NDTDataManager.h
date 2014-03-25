//
//  NDTDataManager.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/23/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NDTUser.h"
#import <CoreData/CoreData.h>

@interface NDTDataManager : NSObject

-(BOOL)addUserWithData:(NDTUser *)user;
-(BOOL)isAlreadyRegistered:(NDTUser *)user;
-(NSArray *)allUsers;

@end
