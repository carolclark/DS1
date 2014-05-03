// =================================================================================
//  ___FILENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___ for project ___PROJECTNAME___.
//	Copyright (c) ___YEAR___ C & C Software, Inc. All rights reserved.
// =================================================================================

___IMPORTHEADER_cocoaSubclass___

@interface ___FILEBASENAMEASIDENTIFIER___ : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
