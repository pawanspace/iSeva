//
//  NSObject+UIImage.m
//  iSeva
//
//  Created by Pawan Chopra on 5/5/14.
//  Copyright (c) 2014 RSSB. All rights reserved.
//

#import "NSObject+UIImage.h"

@implementation UIImage (ImagePLaceHolder)


+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
