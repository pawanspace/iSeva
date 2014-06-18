//
//  SelectSevaViewController.h
//  iSeva
//
//  Created by Pawan Chopra on 6/18/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface SelectSevaViewController : UITableViewController <NSFetchedResultsControllerDelegate>


    @property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

    @property (strong, atomic) NSMutableArray *selectedSeva;


    /*
     MOC connects to PSC.
     
     */

    @property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

