//
//  XIWUserObject.m
//  NursingDocumentTracker
//
//  Created by Stephanie Hsu on 3/23/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "XIWUserObject.h"

@implementation XIWUserObject

-(id)initWithCoder: (NSCoder *)decoder
{
    if (self = [self init]) {
        _username = [decoder decodeObjectForKey:@"username"];
        _password = [decoder decodeObjectForKey:@"password"];
    }
    return self;
}

-(void)encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:_username forKey:@"username"];
    [coder encodeObject:_password forKey:@"password"];
    
}

@end
