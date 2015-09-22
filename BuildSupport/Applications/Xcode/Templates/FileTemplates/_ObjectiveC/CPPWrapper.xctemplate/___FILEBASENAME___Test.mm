// =================================================================================
//  ___FILENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___ for project ___PROJECTNAME___.
//	Copyright (c) ___YEAR___ C & C Software, Inc. All rights reserved.
// =================================================================================

#import <XCTest/XCTest.h>
#import "___FILEBASENAMEASIDENTIFIER___.h"
#import "___FILEBASENAMEASIDENTIFIER____AL.h"

@interface ___FILEBASENAME___Test : XCTestCase

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
	___FILEBASENAME___ * a___FILEBASENAME___ = [[[___FILEBASENAME___ alloc] init] autorelease];
	XCTAssertNotNil (a___FILEBASENAME___);
}

@end
