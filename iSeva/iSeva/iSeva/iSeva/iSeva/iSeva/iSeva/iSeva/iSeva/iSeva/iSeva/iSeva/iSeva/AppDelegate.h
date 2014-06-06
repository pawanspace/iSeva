//
//  AppDelegate.h
//  iSeva
//
//  Created by Chopra, Pawan on 4/21/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/*
 Managed by programmer for saving data in to core data.
 */
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


/*
    Save context into PSC
 */
- (void)saveContext;

/* 
    Get applications directory to save our PSC file. PSC file repersents the Data.
 */
- (NSURL *)applicationDocumentsDirectory;

@end
