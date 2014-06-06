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
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
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
    
    
    UIImageView* image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my.jpg"]];
    image.center = self.view.center;
    image.frame = CGRectMake(image.frame.origin.x, image.frame.origin.y, 50, 50);
    
    // make new layer to contain shadow and masked image
    CALayer* containerLayer = [CALayer layer];
    containerLayer.shadowColor = [UIColor blackColor].CGColor;
    containerLayer.shadowRadius = 10.f;
    containerLayer.shadowOffset = CGSizeMake(0.f, 5.f);
    containerLayer.shadowOpacity = 1.f;
    
    // use the image's layer to mask the image into a circle
    image.layer.cornerRadius = roundf(image.frame.size.width/2.0);
    image.layer.masksToBounds = YES;
    
    // add masked image layer into container layer so that it's shadowed
    [containerLayer addSublayer:image.layer];
    
    // add container including masked image and shadow into view
    [self.view.layer addSublayer:containerLayer];
    
    
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
