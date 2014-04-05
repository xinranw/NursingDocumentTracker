//
//  NDTImageWrapper.h
//  NursingDocumentTracker
//
//  Created by User on 4/4/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NDTDocument : NSObject

@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) NSMutableDictionary *properties;

- (id) init;
- (id) initWithImage: (UIImage *)image;
-(void) addPropertyWithKey: (NSString *)key AndValue: (NSData *)value;

@end
