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
    CategoryImmunizations,
    CategoryLicenses,
    CategoryCertifications,
    CategoryCEUs,
    CategoryResumes,
    CategoryOthers
};

@end
