// =================================================================================
//  ___FILENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___ for project ___PROJECTNAME___.
//	Copyright (c) ___YEAR___ C & C Software, Inc. All rights reserved.
// =================================================================================


#import <XCTest/XCTest.h>

@interface ___FILEBASENAMEASIDENTIFIER___ : XCTestCase

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

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

/*!	\test	example performance test	*/
- (void)testPerformanceExample {
	[self measureBlock:^{
		// code to measure
	}];
}

@end
