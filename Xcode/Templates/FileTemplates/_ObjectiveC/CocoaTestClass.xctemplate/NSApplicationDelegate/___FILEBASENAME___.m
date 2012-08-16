// =================================================================================
//  ___FILEBASENAME___.m		©___YEAR___ C & C Software, Inc. All rights reserved.
//  							Confidential and Proprietary.
// =================================================================================

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAME___

@end

<#Interface File#>
// =================================================================================
//  ___FILEBASENAME___.h		©___YEAR___ C & C Software, Inc. All rights reserved.
//  							Confidential and Proprietary.
// =================================================================================

#import <Cocoa/Cocoa.h>

@interface ___FILEBASENAME___

@end

<#Test Implementation#>
// =================================================================================
//  ___FILEBASENAME___Test.m	©___YEAR___ C & C Software, Inc. All rights reserved.
//  							Confidential and Proprietary.
// =================================================================================

#import "___FILEBASENAME___Test.h"
#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAME___Test

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

/*!	\test	arithmetic 	*/
- (void)testAppDelegate {
	STAssertFalse(1 == 0, @"1 != 0");
}

<#Test Interface#>
// =================================================================================
//  ___FILEBASENAME___Test.h					©___YEAR___ C & C Software, Inc. All rights reserved.
//  							Confidential and Proprietary.
// =================================================================================

#import <SenTestingKit/SenTestingKit.h>

@interface ___FILEBASENAME___Test : SenTestCase

- (void)test___FILEBASENAME___;

@end

