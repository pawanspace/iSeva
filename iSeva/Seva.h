//
//  Seva.h
//  iSeva
//
//  Created by Pawan Chopra on 5/4/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sevadar;

@interface Seva : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *sevadars;
@end

@interface Seva (CoreDataGeneratedAccessors)

- (void)addSevadarsObject:(Sevadar *)value;
- (void)removeSevadarsObject:(Sevadar *)value;
- (void)addSevadars:(NSSet *)values;
- (void)removeSevadars:(NSSet *)values;

@end
