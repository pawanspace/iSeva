//
//  HomeViewController.m
//  iSeva
//
//  Created by Pawan Chopra on 6/18/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import "HomeViewController.h"
#import "MasterViewController.h"
#import "SevaTableViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)displaySevadars:(id)sender {
    
    MasterViewController *masterViewController = [self.storyboard  instantiateViewControllerWithIdentifier:@"sevadarView"];
    [masterViewController setManagedObjectContext:self.managedObjectContext];
    [self.navigationController pushViewController:masterViewController animated:YES];
    
}

- (IBAction)displaySeva:(id)sender {
    
    SevaTableViewController *sevaViewController = [self.storyboard  instantiateViewControllerWithIdentifier:@"sevaView"];
    [sevaViewController setManagedObjectContext:self.managedObjectContext];
    [self.navigationController pushViewController:sevaViewController animated:YES];
    
}
@end
