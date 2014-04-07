//
//  NDTImageWrapper.m
//  NursingDocumentTracker
//
//  Created by User on 4/4/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import "NDTDocument.h"

@implementation NDTDocument

- (id) init
{
    _image = nil;
    _properties = [[NSMutableDictionary alloc] init];
    return self;
}

- (id) initWithImage: (UIImage *)image
{
    _image = image;
    _properties = [[NSMutableDictionary alloc] init];
    return self;
}

- (id) initWithImage: (UIImage *)image andProperties: (NSDictionary *) properties
{
    _image = image;
    _properties = [[NSMutableDictionary alloc] initWithDictionary:properties];
    return self;
}

-(void) addImage:(UIImage *) image
{
    _image = image;
}

-(void) addPropertyWithKey: (NSString *)key AndValue: (NSData *)value{
    [_properties setObject:value forKey:key];
}




@end
