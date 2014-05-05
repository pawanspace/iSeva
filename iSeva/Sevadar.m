//
//  Sevadar.m
//  iSeva
//
//  Created by Pawan Chopra on 5/4/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import "Sevadar.h"
#import "Seva.h"


@implementation Sevadar

@dynamic availability;
@dynamic city;
@dynamic email;
@dynamic name;
@dynamic phone;
@dynamic thumbnail;
@dynamic thumbnailData;
@dynamic sevas;


-(void)setThumbnailDataFromImage:(UIImage *)image
{
    
    CGSize originalImageSize = [image size];
    
    CGRect newRect = CGRectMake(0, 0, 40, 40);
    
    float ratio = MAX(newRect.size.width/originalImageSize.width, newRect.size.height/originalImageSize.height);
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5.0];
    
    [path addClip];
    
    CGRect projectRect;
    projectRect.size.width = ratio * originalImageSize.width;
    projectRect.size.height = ratio * originalImageSize.height;
    projectRect.origin.x   = (newRect.size.width - projectRect.size.width)/2.0;
    projectRect.origin.y   = (newRect.size.height - projectRect.size.height)/2.0;
    
    [image drawInRect:projectRect];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [self setThumbnail:smallImage];
    
    NSData *data = UIImagePNGRepresentation(smallImage);
    
    [self setThumbnailData:data];
    
    UIGraphicsEndImageContext();
    
}

-(void)awakeFromFetch
{
    [super awakeFromFetch];
    
    UIImage *transientImage = [UIImage imageWithData:[self thumbnailData]];
    
    [self setPrimitiveValue:transientImage forKey:@"thumbnail"];
}



@end
