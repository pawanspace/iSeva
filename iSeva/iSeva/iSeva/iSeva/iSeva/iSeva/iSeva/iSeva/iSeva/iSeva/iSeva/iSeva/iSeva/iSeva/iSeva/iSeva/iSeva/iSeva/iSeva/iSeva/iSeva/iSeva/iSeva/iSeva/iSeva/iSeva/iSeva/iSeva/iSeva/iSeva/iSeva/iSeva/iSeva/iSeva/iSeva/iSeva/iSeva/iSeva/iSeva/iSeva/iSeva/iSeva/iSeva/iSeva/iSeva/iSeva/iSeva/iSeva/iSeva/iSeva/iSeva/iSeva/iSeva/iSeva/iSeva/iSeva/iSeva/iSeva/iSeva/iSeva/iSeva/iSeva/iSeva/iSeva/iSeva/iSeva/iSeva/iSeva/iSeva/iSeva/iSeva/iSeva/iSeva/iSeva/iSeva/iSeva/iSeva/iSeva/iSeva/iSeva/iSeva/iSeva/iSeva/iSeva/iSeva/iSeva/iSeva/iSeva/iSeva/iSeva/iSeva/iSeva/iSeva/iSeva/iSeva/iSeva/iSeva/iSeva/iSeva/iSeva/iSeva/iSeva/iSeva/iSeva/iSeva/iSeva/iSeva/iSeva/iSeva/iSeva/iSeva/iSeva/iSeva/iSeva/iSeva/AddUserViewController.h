//
//  AddUserViewController.h
//  iSeva
//
//  Created by Chopra, Pawan on 4/21/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreData/CoreData.h>
#import "MasterViewController.h"

@interface AddUserViewController : UITableViewController  <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *sevadarPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *sevadarEmail;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UISwitch *availability;
@property (weak, nonatomic) IBOutlet UIButton *addSevadar;

@property (strong, nonatomic) IBOutlet UIImageView *sevadarImage;


@property (strong, nonatomic) IBOutlet UIView *imageCell;


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) MasterViewController *masterViewController;


/*
 MOC connects to PSC.
 
 */

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end
