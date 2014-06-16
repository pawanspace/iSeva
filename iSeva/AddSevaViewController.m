//
//  AddSevaViewController.m
//  iSeva
//
//  Created by Pawan Chopra on 5/8/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import "AddSevaViewController.h"

@interface AddSevaViewController ()

@end

@implementation AddSevaViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sevaName.delegate = self;
    self.location.delegate = self;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addSeva:(id)sender {
    
    self.seva = [NSEntityDescription
                    insertNewObjectForEntityForName:@"Seva"
                    inManagedObjectContext:self.managedObjectContext];
    
    
    
    
    
    if(_seva == nil){
        NSLog(@"Seva is null");
    }
    
    [self.seva setName:self.sevaName.text];
    [self.seva setDesc:self.description.text];
    [self.seva setLocation:self.location.text];
    
    
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
