//
//  NDTMainViewControllerTest.m
//  NursingDocumentTracker
//
//  Created by Yesha Ouyang on 4/8/14.
//  Copyright (c) 2014 CIS350. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Parse/Parse.h>
#import "NDTMainViewController.h"
#import "NDTLogInViewController.h"

@interface NDTMainViewControllerTest : XCTestCase

@end

@implementation NDTMainViewControllerTest

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

//- (void)testLoginRequestSubmitEmptyString
//{
//    PFLogInViewController *testController = [[PFLogInViewController alloc] init];
//    NSString *username = @"";
//    NSString *password = @"password";
//    BOOL isComplete =logInViewController:testController shouldBeginLogInWithUsername:username password:password;
//    XCTAssertFalse(isComplete, @"Should not allow login of account with empty username");
//}
//
//- (void)testLoginRequestSubmitNullString
//{
//    PFLogInViewController *testController = [[PFLogInViewController alloc] init];
//    NSNull *username;
//    NSNull *password;
//    BOOL isComplete =logInViewController:testController shouldBeginLogInWithUsername:username password:password;
//    XCTAssertFalse(isComplete, @"Should not allow login of account with null strings");
//}
//
//- (void)testSignUpRequestEmptyFields
//{
//    PFSignUpViewController *testController = [[PFSignUpViewController alloc]init];
//    NSDictionary *info = [[NSDictionary init] alloc];
//    BOOL isInformationComplete = signUpViewController:testController shouldBeginSignUp:info;
//    XCTAssertFalse(isInformationComplete, @"Empty fields should return no, as well as display an alert behaviorally");
//}

@end
