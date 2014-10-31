// =================================================================================
//  CCDev_UTests.m
//
//  Created by Carol Clark on 10/31/14 for project CCDev.
//	Copyright (c) 2014 C & C Software, Inc. All rights reserved.
// =================================================================================


@import XCTest;

@interface CCDev_UTests : XCTestCase

- (void)testExample;

@end

@implementation CCDev_UTests

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
