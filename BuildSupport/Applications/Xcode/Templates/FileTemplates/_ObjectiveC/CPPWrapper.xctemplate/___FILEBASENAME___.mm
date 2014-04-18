// =================================================================================
//  ___FILEBASENAME___.mm		(c)___YEAR___ C & C Software, Inc. All rights reserved.
//  							Confidential and Proprietary.
// =================================================================================

#import "___FILEBASENAME___.h"
#import "___FILEBASENAME____AL.h"

@implementation ___FILEBASENAME___CP
@synthesize cpp = _cpp;

struct ___FILEBASENAME___Opaque {
___FILEBASENAME___Opaque() {};
al::___FILEBASENAME___ ___FILEBASENAMEASIDENTIFIER___;
};

- (id)init {
	self = [super init];
	if (self != nil) {
		self.cpp = new ___FILEBASENAME___Opaque;
	}
	return self;
}

- (void)dealloc {
	delete _cpp;
	_cpp = NULL;
	
	[super dealloc];
}

#pragma mark	Interface for Testing
/*! \name		InterfaceForTesting */
//@{
//@}

@end

<#Interface File#>
// =================================================================================
//  ___FILEBASENAME___.h		(c)___YEAR___ C & C Software, Inc. All rights reserved.
//  							Confidential and Proprietary.
// =================================================================================

struct ___FILEBASENAME___Opaque;

@interface ___FILEBASENAME___CP : NSObject {
struct ___FILEBASENAME___Opaque *_cpp;
}

@property (nonatomic, readwrite, assign) ___FILEBASENAME___Opaque *cpp;

#pragma mark Interface for Testing

@end
<#Test Implementation#>
// =================================================================================
//  ___FILEBASENAME___Test.mm					(c)___YEAR___ C & C Software, Inc. All rights reserved.
//  							Confidential and Proprietary.
// =================================================================================

#import "___FILEBASENAME___Test.h"
#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAME___Test

/*! \test	wrapper construction */
- (void)test___FILEBASENAME___ {
	___FILEBASENAME___CP *a___FILEBASENAME___ = [[[___FILEBASENAME___CP alloc] init] autorelease];
	STAssertNotNil (a___FILEBASENAME___, nil);
	STAssertNotNil ((id)[a___FILEBASENAME___ cpp], nil);
}
<#Test Interface#>
// =================================================================================
//  ___FILEBASENAME___Test.h					(c)___YEAR___ C & C Software, Inc. All rights reserved.
//  							Confidential and Proprietary.
// =================================================================================

#import <SenTestingKit/SenTestingKit.h>

@interface ___FILEBASENAME___Test : SenTestCase

- (void)test___FILEBASENAME___;

@end

