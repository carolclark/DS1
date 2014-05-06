// =================================================================================
//  ___FILENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___ for project ___PROJECTNAME___.
//	Copyright (c) ___YEAR___ C & C Software, Inc. All rights reserved.
// =================================================================================

#import "___FILEBASENAMEASIDENTIFIER___.h"
#import "___FILEBASENAMEASIDENTIFIER___<#remove preceding 'Test'#>.h"

@implementation ___FILEBASENAMEASIDENTIFIER___


- (void)setUp {
	[super setUp];
    mom = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];
    NSLog(@"mom: %@", mom);
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    store = [psc addPersistentStoreWithType: NSInMemoryStoreType
							  configuration: nil
										URL: nil
									options: nil 
									  error: NULL];
    moc = [[NSManagedObjectContext alloc] init];
    [moc setPersistentStoreCoordinator:psc];
}

- (void)tearDown {
	[super tearDown];
    [moc release];
    moc = nil;
    NSError * error = nil;
    STAssertTrue([psc removePersistentStore:store error:&error], @"could not remove persistent store: %@", error);
    store = nil;
    [psc release];
    psc = nil;
    [mom release];
    mom = nil;
}

- (void)testPersistentStoreSetup {
    STAssertNotNil(store, @"no persistent store");
}

@end
