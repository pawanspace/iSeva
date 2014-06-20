//
//  AddUserViewController.m
//  iSeva
//
//  Created by Chopra, Pawan on 4/21/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import "AddUserViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SelectSevadarViewController.h"

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


- (IBAction)insertSevadar:(id)sender {
    [self insertNewObject:sender];
}

//- (IBAction)backgroundTouched:(id)sender {
//    [self.view endEditing:YES];
//}




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

- (IBAction)addSeva:(id)sender {
    
        SelectSevadarViewController *selectSevadarController  = [self.storyboard  instantiateViewControllerWithIdentifier:@"selectSeva"];
        [selectSevadarController setManagedObjectContext:self.managedObjectContext];
        [self.navigationController pushViewController:selectSevadarController animated:YES];
        
}









- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *imageDefault = [UIImage imageNamed:@"default-avatar.jpeg"];
    UIImageView* image = [[UIImageView alloc] initWithImage:imageDefault];

    _sevadar = self.detailItem;
    if(_sevadar != nil){
        self.sevadarEmail.text = _sevadar.email;
        self.sevadarPhoneNumber.text = _sevadar.phone;
        self.name.text = _sevadar.name;
        self.city.text = _sevadar.city;
        self.availability.on = _sevadar.availability;
        NSString *imageName = [[_sevadar.name
                                stringByReplacingOccurrencesOfString:@" "  withString:@"_"] stringByAppendingString:@".png"];
        NSString *filePath = [self getDocumentPathForFileName:imageName];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        UIImage *realImage = [UIImage imageWithData:data];
        
        image = [[UIImageView alloc] initWithImage:realImage];
        self.titleItem.title = @"Edit Sevadar";
    }
    
    self.sevadarEmail.delegate = self;
    self.sevadarPhoneNumber.delegate = self;
    self.name.delegate = self;
    self.city.delegate = self;
    
    
    [self loadImage:image];
   
    
	// Do any additional setup after loading the view.
}

- (NSString*) getDocumentPathForFileName:(NSString*)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdsPath = [paths objectAtIndex:0];
    NSString *filePath = [documentdsPath stringByAppendingPathComponent:name];
    return filePath;
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
    
    // use the image's layer to mask the image into a circle
    image.layer.cornerRadius = roundf(image.frame.size.width/2.0);
    image.layer.masksToBounds = YES;
    
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
    NSString *imageName = [[self.name.text stringByReplacingOccurrencesOfString:@" "  withString:@"_"] stringByAppendingString:@".png"];
    
    NSData *pngData = UIImagePNGRepresentation(self.sevadarImage.image);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdsPath = [paths objectAtIndex:0];
    NSLog(@"%@",documentdsPath);
    NSString *filePath = [documentdsPath stringByAppendingPathComponent:imageName];
    [pngData writeToFile:filePath atomically:YES];
    
    
    if(self.sevadar == nil){
        self.sevadar = [NSEntityDescription
                 insertNewObjectForEntityForName:@"Sevadar"
                 inManagedObjectContext:self.managedObjectContext];
    }

    if(_sevadar == nil){
        NSLog(@"Sevadar is null");
    }
    
    [self.sevadar setName:self.name.text];
    [self.sevadar setEmail:self.sevadarEmail.text];
    
    NSNumber *availabilityNum  = [NSNumber numberWithBool:self.availability.on];
    
    [self.sevadar setAvailability:availabilityNum];
    
    [self.sevadar setCity:self.city.text];
    
    [self.sevadar setThumbnailDataFromImage:self.sevadarImage.image];
    
    [self.sevadar setPhone:self.sevadarPhoneNumber.text];
    
    // Save the context.
   NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


@end


