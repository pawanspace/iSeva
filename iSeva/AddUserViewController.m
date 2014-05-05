//
//  AddUserViewController.m
//  iSeva
//
//  Created by Chopra, Pawan on 4/21/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import "AddUserViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+ImagePlaceHolder.h"

@interface AddUserViewController ()


@end

@implementation AddUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)addImage:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    //If device has camera
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else{
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //Get image from selection
    
    UIImage *imageFromSelection = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //put that image to image view;
    [self.sevadarImage setImage:imageFromSelection];
    UIImageView* image = [[UIImageView alloc] initWithImage:imageFromSelection];
    
    
    //remove image picker
    [self loadImage:image];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *color = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
    
    UIImage *imagePlaceHolder = [UIImage imageWithColor:color];

    
    UIImageView* image = [[UIImageView alloc] initWithImage:imagePlaceHolder];
    
    [self loadImage:image];
   
    
	// Do any additional setup after loading the view.
}





- (void)loadImage:(UIImageView*)image
{
    image.center = self.view.center;
    image.frame = CGRectMake(20, 10, 80, 80);
    

    
    // make new layer to contain shadow and masked image
    CALayer* containerLayer = [CALayer layer];
    containerLayer.shadowColor = [UIColor blackColor].CGColor;
    containerLayer.shadowRadius = 10.f;
    containerLayer.shadowOffset = CGSizeMake(0.f, 5.f);
    containerLayer.shadowOpacity = 1.f;
    containerLayer.opacity = 1.f;
    
    // use the image's layer to mask the image into a circle
    image.layer.cornerRadius = roundf(image.frame.size.width/2.0);
    image.layer.masksToBounds = YES;
    
    
    CGPoint point = CGPointMake(0, 0);
    UIFont *font = [UIFont boldSystemFontOfSize:12];
    UIGraphicsBeginImageContext(image.image.size);
    [image.image drawInRect:CGRectMake(0,0,image.image.size.width,image.image.size.height)];
    CGRect rect = CGRectMake(point.x, point.y, image.image.size.width, image.image.size.height);
    [[UIColor whiteColor] set];
    [@"Image" drawInRect:CGRectIntegral(rect) withFont:font];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    [image setImage:newImage];
    UIGraphicsEndImageContext();

    
    // add masked image layer into container layer so that it's shadowed
    [containerLayer addSublayer:image.layer];
    
    // add container including masked image and shadow into view
    [self.imageCell.layer addSublayer:containerLayer];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender
{
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


@end


