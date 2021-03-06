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
#import "Sevadar.h"
@class SelectSevaViewController;

@interface AddUserViewController : UITableViewController  <UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *sevadarPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *sevadarEmail;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UISwitch *availability;
@property (weak, nonatomic) IBOutlet UIButton *addSevadar;
@property (strong, nonatomic) NSArray *colorArray;
@property (strong, nonatomic) NSMutableArray *selectedItems;

@property (strong, nonatomic) Sevadar *sevadar;
@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UINavigationItem *titleItem;



@property (strong, nonatomic) IBOutlet UIImageView *sevadarImage;

- (IBAction)insertSevadar:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *imageCell;


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) MasterViewController *masterViewController;

@property (strong, nonatomic) SelectSevaViewController *selectSevaController;

- (IBAction)addImage:(id)sender;


- (IBAction)addSeva:(id)sender;

- (void)toggleSelection:(UITapGestureRecognizer *)recognizer;

/*
 MOC connects to PSC.
 
 */

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end
