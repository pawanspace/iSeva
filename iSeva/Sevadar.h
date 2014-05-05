//
//  Sevadar.h
//  iSeva
//
//  Created by Pawan Chopra on 5/4/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Seva;

@interface Sevadar : NSManagedObject

@property (nonatomic, retain) NSNumber * availability;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) UIImage  *thumbnail;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, retain) NSSet *sevas;
@end

@interface Sevadar (CoreDataGeneratedAccessors)

- (void)addSevasObject:(Seva *)value;
- (void)removeSevasObject:(Seva *)value;
- (void)addSevas:(NSSet *)values;
- (void)removeSevas:(NSSet *)values;
-(void)setThumbnailDataFromImage:(UIImage *)image;
@end
