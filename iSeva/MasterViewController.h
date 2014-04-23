//
//  MasterViewController.h
//  iSeva
//
//  Created by Chopra, Pawan on 4/21/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class AddUserViewController;

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) AddUserViewController *addUserViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;


/*
    MOC connects to PSC.
 
 */

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
