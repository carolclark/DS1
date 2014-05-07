// =================================================================================
//  AlertPresenterDD.m
//
//  Created by Carol Clark on 10/19/12 for project KidsCorner.
//	(c)2012 C & C Software, Inc. All rights reserved. Confidential and Proprietary.
// =================================================================================

#import "AlertPresenterDD.h"
#import "WordsApp.h"
#import "WordsWindowC.h"

AlertPresenterDD * _sharedInstance = nil;

/*! \brief		mockable alert and error presenter
	\details	intended for use by Application object to display a customized error message
	\note		This mockable class is not intended to be used directly except by a host object that maintains a reference to it. For testing, a different class can be substituted.
 */
@implementation AlertPresenterDD

/*! \brief		present message to user
	\details	uses a sheet for the specified window, if any; otherwise, displays modal alert\n
				for testing, see MockAlertPresenter
 */
+ (void)presentMessage:(NSString *)message withTitle:(NSString *)title forWindow:(NSWindow *)window {
	NSAlert * alert = [NSAlert alertWithMessageText:title
									 defaultButton:nil	alternateButton:nil	otherButton:nil
						 informativeTextWithFormat:@"%@", message];

	[[AlertPresenterDD sharedInstance] doPresentAlert:alert forWindow:window];
}

/*! \brief		present Alert to user
	\details	uses a sheet for the specified window, if any; otherwise, displays modal alert\n
				for testing, see MockAlertPresenter
 */
+ (long)presentAlert:(NSAlert *)alert forWindow:(NSWindow *)window {
	return [[AlertPresenterDD sharedInstance] doPresentAlert:alert forWindow:window];
}

/*! \brief		present error to user
	\details	uses a sheet for the specified window, if any; otherwise, displays modal alert\n
				for testing, see MockAlertPresenter
 */
+ (int)presentError:(NSError *)error forWindow:(NSWindow *)window {
	return [[AlertPresenterDD sharedInstance] doPresentError:error forWindow:window];
/*
	NSAlert * alert = [NSAlert alertWithError:error];
	return [[AlertPresenterDD sharedInstance] doPresentAlert:alert forWindow:window];
 */
}

/*! \brief		present a document-modal alert if window is open, else present modal alert
	\details	This method is used to present both Errors and Alerts.
	\result		user's response
	\note		Currently, the document-modal alert does not return the user's response;
				see http://stackoverflow.com/questions/604768/wait-for-nsalert-beginsheetmodalforwindow
			\n If we need the response before Apple fixes the problem, we could switch to modal alerts.
 */
- (long)doPresentAlert:(NSAlert *)alert forWindow:(NSWindow *)window {
	long response = 0;
	if (window == nil) {
		response = [alert runModal];
	} else {
	    [alert beginSheetModalForWindow:window
				  modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:)contextInfo:(void *)nil];
	}
	return response;
}

- (void)alertDidEnd:(NSAlert *)alert returnCode:(int)returnCode contextInfo:(void *)contextInfo {
    [[alert window] orderOut:self];
}

- (int)doPresentError:(NSError *)error forWindow:(NSWindow *)window {
	int response = 0;
	if (window == nil) {
		[[NSApp delegate] presentError:error];
	} else {
		[window presentError:error
			  modalForWindow:window
					delegate:self
		  didPresentSelector:@selector(didPresentErrorWithRecovery:contextInfo:)
				 contextInfo:nil];
	}
	return response;
}

- (void)didPresentErrorWithRecovery:(BOOL)recover contextInfo:(void *)info {
	if (recover == NO) { // Recovery did not succeed, or no recovery attempted.
		// Proceed accordingly.
	}
}

+ (AlertPresenterDD *)sharedInstance {
	if (!_sharedInstance) {
		AlertPresenterDD * presenter = [[AlertPresenterDD alloc] init];
		_sharedInstance = presenter;
	}
	return _sharedInstance;
}

/*! \brief	intended for use by testing systems to preset a mock AlertPresenterDD object */
+ (void)mockSharedPresenter:(AlertPresenterDD *)presenter {
	_sharedInstance = presenter;
}

@end
