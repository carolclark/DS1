// =================================================================================
//  ___FILENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___ for project ___PROJECTNAME___.
//	Copyright (c) ___YEAR___ C & C Software, Inc. All rights reserved.
// =================================================================================

#import <XCTest/XCTest.h>
#import "___FILEBASENAMEASIDENTIFIER___<#delete_OC#>.h"
#define protected public
#import "___FILEBASENAMEASIDENTIFIER___.h"

@interface ___FILEBASENAMEASIDENTIFIER___Test : XCTestCase

- (void)testWrapper;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___Test

- (void)setUp {
    [super setUp];
	// setup code
}

- (void)tearDown {
	// teardown code
    [super tearDown];
}

/*!	\test	example 	*/
- (void)testExample {
    XCTAssertTrue (1 == 0, @"%s: Oops! 1 is not 0.", __PRETTY_FUNCTION__);
}

/*! \test	wrapper construction */
- (void)testWrapper {
	___FILEBASENAMEASIDENTIFIER___ * a___FILEBASENAMEASIDENTIFIER___ = new ___FILEBASENAMEASIDENTIFIER___;
	XCTAssertTrue (a___FILEBASENAMEASIDENTIFIER___ != 0);
	XCTAssertNotNil (a___FILEBASENAMEASIDENTIFIER___->wrapped);
}

@end
