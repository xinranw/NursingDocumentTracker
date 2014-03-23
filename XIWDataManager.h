//
//  XIWDataManager.h
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/23/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Users.h"
#import "XIWUserObject.h"
#import <CoreData/CoreData.h>

@interface XIWDataManager : NSObject

-(BOOL)addUserWithData:(XIWUserObject *)user;
-(BOOL)checkIfAlreadyRegistered:(XIWUserObject *)user;
-(NSArray *)allUsers;

@end
