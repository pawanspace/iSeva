//
//  AddSevaViewController.h
//  iSeva
//
//  Created by Pawan Chopra on 5/8/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Seva.h"
@class SevaTableViewController;

@interface AddSevaViewController : UITableViewController  <UINavigationControllerDelegate,UITextFieldDelegate>



    @property (strong, nonatomic) IBOutlet UITextField *sevaName;

    @property (strong, nonatomic) IBOutlet UITextField *location;
    @property (strong, nonatomic) IBOutlet UITextView *description;
    - (IBAction)addSeva:(id)sender;

    @property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

    @property (strong, nonatomic) SevaTableViewController *sevaTableViewController;

    @property (strong, nonatomic) Seva *seva;

    /*
     MOC connects to PSC.
     
     */

    @property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
