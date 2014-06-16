//
//  DetailViewController.m
//  iSeva
//
//  Created by Chopra, Pawan on 4/21/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import "DetailViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contextSaved:) name:NSManagedObjectContextDidSaveNotification object:self.managedObjectContext];
    if (self.detailItem) {
        self.name.text = [[self.detailItem valueForKey:@"name"] description];
        self.email.text = [[self.detailItem valueForKey:@"email"] description];
        self.phoneNumber.text = [[self.detailItem valueForKey:@"phone"] description];
        self.availability.on = [[self.detailItem valueForKey:@"availability"] boolValue];
        
        self.city.text = [[self.detailItem valueForKey:@"city"] description];
        
        NSString *imageName = [[[[self.detailItem valueForKey:@"name"] description]
                                stringByReplacingOccurrencesOfString:@" "  withString:@"_"] stringByAppendingString:@".png"];
        NSString *filePath = [self getDocumentPathForFileName:imageName];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        UIImage *realImage = [UIImage imageWithData:data];
        
        self.image.image = realImage;
       
        UIImageView* realImageView = [[UIImageView alloc] initWithImage:realImage];
        
        [self loadImage:realImageView];
        
    }
}



- (void)loadImage:(UIImageView*)image
{
    image.center = self.imageCell.center;
    image.frame = CGRectMake(20, 10, 80, 80);
    
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
    [self.imageCell.layer addSublayer:containerLayer];
}




- (void) contextSaved:(id)sender{
    
    self.name.text = [[self.detailItem valueForKey:@"name"] description];
    self.availability.enabled =[[self.detailItem valueForKey:@"availability"] description];
    self.email.text = [[self.detailItem valueForKey:@"email"] description];
    self.phoneNumber.text = [[self.detailItem valueForKey:@"phone"] description];
    self.availability.on = [[self.detailItem valueForKey:@"availability"] boolValue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"editUser"]) {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
        [[segue destinationViewController] setUser:self.detailItem ];
    }
}


- (NSString*) getDocumentPathForFileName:(NSString*)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdsPath = [paths objectAtIndex:0];
    NSString *filePath = [documentdsPath stringByAppendingPathComponent:name];
    return filePath;
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

@end
