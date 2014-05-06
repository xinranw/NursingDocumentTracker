//
//  NDTUploadControllerTest.m
//  NursingDocumentTracker
//
//  Created by Yesha Ouyang on 5/6/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NDTUploadController.h"

@interface NDTUploadControllerTest : XCTestCase

@end

@implementation NDTUploadControllerTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Testing a general category should match up
- (void)testDocumentCategoryToStringLicense
{
    NSString *expected = @"License";
    NSString *actual = [NDTUploadController documentCategoryToString:1];
    
    XCTAssertEqualObjects(expected, actual, @"Categories should match up.");
}

// Testing that we handle erroneous input properly
- (void)testDocumentCategoryToStringOther
{
    NSString *expected = @"Other";
    NSString *actual = [NDTUploadController documentCategoryToString:6];
    
    XCTAssertEqualObjects(expected, actual, @"Other category soaks up erroneous input.");
}

- (void)testDateOneYearFromNow
{
    NSString *expected = @"2015-05-06";     // this has to be changed according to what day it actually is, every time we run the test
    
    NDTUploadController *testController = [[NDTUploadController alloc] init];
    NSDate *oneYearFromNow = [testController dateOneYearFromNow];
    NSString *oneYearFromNowString = [NSString stringWithFormat:@"%@", oneYearFromNow];
    NSString *actual = [oneYearFromNowString substringWithRange:NSMakeRange(0, 10)];
    
    XCTAssertEqualObjects(expected, actual, @"One year from now should appear correctly,");
}

@end
