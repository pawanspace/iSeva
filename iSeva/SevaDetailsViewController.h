//
//  SevaDetailsViewController.h
//  iSeva
//
//  Created by Pawan Chopra on 5/8/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SevaDetailsViewController : UITableViewController

    @property (strong, nonatomic) id detailItem;

    @property (strong, nonatomic) IBOutlet UILabel *sevaName;
    @property (strong, nonatomic) IBOutlet UILabel *location;
    @property (strong, nonatomic) IBOutlet UILabel *description;
    - (IBAction)viewAssignedSevadars:(id)sender;
    - (IBAction)addNewSeva:(id)sender;
    - (IBAction)editSeva:(id)sender;

@end
