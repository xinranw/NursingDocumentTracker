//
//  NDTDocumentCategory.h
//  NursingDocumentTracker
//
//  Created by User on 4/4/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NDTDocumentCategory <NSObject>

typedef NS_ENUM(NSInteger, NDTDocumentCategory) {
    CategoryImmunizations = 0,
    CategoryLicenses = 1,
    CategoryCertifications = 2,
    CategoryCEUs = 3,
    CategoryResumes = 4,
    CategoryOthers = 5
};

@end
