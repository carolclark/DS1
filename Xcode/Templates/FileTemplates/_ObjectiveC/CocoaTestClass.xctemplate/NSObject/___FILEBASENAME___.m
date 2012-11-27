// =================================================================================
//  ___FILENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___ for project ___PROJECTNAME___.
//	©___YEAR___ C & C Software, Inc. All rights reserved. Confidential and Proprietary.
// =================================================================================

#import "PunkinTestCase.h"
#import "___FILEBASENAMEASIDENTIFIER___<#remove preceding 'Test'#>.h"


@interface ___FILEBASENAMEASIDENTIFIER___ : PunkinTestCase

- (void)testArithmetic;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___


- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

/*!	\test	arithmetic 	*/
- (void)testArithmetic {
	STAssertFalse(1 == 0, @"1 != 0");
}

@end
