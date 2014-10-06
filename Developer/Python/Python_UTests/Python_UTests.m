// =================================================================================
//  Python_UTests.m
//
//  Created by Carol Clark on 10/4/14 for project Python.
//	Copyright (c) 2014 C & C Software, Inc. All rights reserved.
// =================================================================================


@import XCTest;

@interface Python_UTests : XCTestCase

- (void)testExample;

@end

@implementation Python_UTests

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
    XCTAssertTrue (1 == 1, @"%s: Oops! 1 is not 0.", __PRETTY_FUNCTION__);
}

@end
