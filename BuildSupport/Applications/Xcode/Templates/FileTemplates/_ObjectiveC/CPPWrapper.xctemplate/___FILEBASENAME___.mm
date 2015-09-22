// =================================================================================
//  ___FILEBASENAME___.mm
//
//  Created by ___FULLUSERNAME___ on ___DATE___ for project ___PROJECTNAME___.
//	Copyright (c) ___YEAR___ C & C Software, Inc. All rights reserved.
// =================================================================================

#import "___FILEBASENAME___.h"
#import "___FILEBASENAME____AL.h"

@interface ___FILEBASENAMEASIDENTIFIER___ () {
	___FILEBASENAMEASIDENTIFIER___AL *	_wrapped;
}
@end

@implementation ___FILEBASENAME___

- (id)init {
	self = [super init];
	if (self) {
		_wrapped = new ___FILEBASENAMEASIDENTIFIER___AL;
		if (!_wrapped) self = nil;
	}
	return self;
}

- (void)dealloc {
	delete _wrapped;
	_wrapped = NULL;
	
	[super dealloc];		// omit if using ARC
}

@end
