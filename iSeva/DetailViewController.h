//
//  DetailViewController.h
//  iSeva
//
//  Created by Chopra, Pawan on 4/21/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;


@property (strong, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) IBOutlet UILabel *name;

@property (strong, nonatomic) IBOutlet UILabel *phoneNumber;

@property (strong, nonatomic) IBOutlet UILabel *city;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UISwitch *availability;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
