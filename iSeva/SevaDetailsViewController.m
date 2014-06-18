//
//  SevaDetailsViewController.m
//  iSeva
//
//  Created by Pawan Chopra on 5/8/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import "SevaDetailsViewController.h"

@interface SevaDetailsViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end


@implementation SevaDetailsViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.description.text = [[self.detailItem valueForKey:@"desc"] description];
        self.sevaName.text = [[self.detailItem valueForKey:@"name"] description];
        self.location.text = [[self.detailItem valueForKey:@"location"] description];
    }
}

- (void)addUser
{
    [self performSegueWithIdentifier:@"detailToAdd" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //  self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addUser)];
    self.navigationItem.rightBarButtonItem = addButton;
    
   	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


- (IBAction)viewAssignedSevadars:(id)sender {
}

- (IBAction)addNewSeva:(id)sender {
}

- (IBAction)editSeva:(id)sender {
}
@end
