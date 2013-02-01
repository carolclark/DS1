// =================================================================================
//  AlertPresenter.h
//
//  Created by Carol Clark on 10/19/12 for project KidsCorner.
//	©2012 C & C Software, Inc. All rights reserved. Confidential and Proprietary.
// =================================================================================

#import <Foundation/Foundation.h>

@interface AlertPresenter : NSObject

+ (void)mockSharedPresenter:(AlertPresenter *)presenter;

+ (void)presentMessage:(NSString *)message withTitle:(NSString *)title forWindow:(NSWindow *)window;
+ (long)presentAlert:(NSAlert *)alert forWindow:(NSWindow *)window;
+ (int)presentError:(NSError *)error forWindow:(NSWindow *)window;

- (long)doPresentAlert:(NSAlert *)alert forWindow:(NSWindow *)window;
- (int)doPresentError:(NSError *)error forWindow:(NSWindow *)window;

@end
