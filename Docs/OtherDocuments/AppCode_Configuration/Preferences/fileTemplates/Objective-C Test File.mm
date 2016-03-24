//
//  ${NAME}
//
//  Created by ${USER} on ${DATE}.
//	Copyright (c) ${YEAR} C & C Software, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>


@interface ${NAME} : XCTestCase {
	// instance variables
} 

@end

@implementation ${NAME}

- (void)tearDown {
	// teardown code
    [super tearDown];
}

/*!	\test	example 	*/
- (void)testExample {
    XCTAssertTrue (1 == 0, @"%s: Oops! 1 is not 0.", __PRETTY_FUNCTION__);
}

@end
