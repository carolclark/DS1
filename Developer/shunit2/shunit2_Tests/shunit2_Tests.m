// =================================================================================
//  shunit2_Tests.m
//
//  Created by Carol Clark on 10/17/14 for project shunit2.
//	Copyright (c) 2014 C & C Software, Inc. All rights reserved.
// =================================================================================


@import XCTest;

@interface shunit2_Tests : XCTestCase

- (void)testExample;

@end

@implementation shunit2_Tests

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
