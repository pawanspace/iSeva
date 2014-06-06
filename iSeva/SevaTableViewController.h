//
//  SevaTableViewController.h
//  iSeva
//
//  Created by Pawan Chopra on 5/8/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SevaDetailsViewController;
@class AddSevaViewController;

@interface SevaTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) SevaDetailsViewController *sevaDetailsViewController;

@property (strong, nonatomic) AddSevaViewController *addSevaViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;



/*
 MOC connects to PSC.
 
 */

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
