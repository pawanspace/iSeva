//
//  AddUserViewController.h
//  iSeva
//
//  Created by Chopra, Pawan on 4/21/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddUserViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIView *sevadarName;

@property (weak, nonatomic) IBOutlet UITextField *sevadarPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *sevadarEmail;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UISwitch *availability;
@property (weak, nonatomic) IBOutlet UIButton *addSevadar;

@end
