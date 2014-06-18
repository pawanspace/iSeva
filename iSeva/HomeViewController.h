//
//  HomeViewController.h
//  iSeva
//
//  Created by Pawan Chopra on 6/18/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface HomeViewController : UIViewController<NSFetchedResultsControllerDelegate>

- (IBAction)displaySevadars:(id)sender;


- (IBAction)displaySeva:(id)sender;


@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
