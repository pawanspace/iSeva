//
//  ImageTableViewCell.h
//  CoreDataSample
//
//  Created by Pawan Chopra on 5/4/14.
//  Copyright (c) 2014 dummiesmind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *thumbnail;

@property (strong, nonatomic) IBOutlet UILabel *name;

@end
