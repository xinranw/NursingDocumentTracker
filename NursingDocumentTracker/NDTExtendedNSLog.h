//
//  NDTExtendedNSLog.h
//  NursingDocumentTracker
//
//  Created by Yesha Ouyang on 4/18/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

// redefines NSLog function if and only if DEBUG=1 in preprocessor build settings for project
#ifdef DEBUG
#define NSLog(args...) ExtendNSLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
#define NSLog(x...)
#endif

void ExtendNSLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...);

@interface NDTExtendedNSLog : NSObject

@end
