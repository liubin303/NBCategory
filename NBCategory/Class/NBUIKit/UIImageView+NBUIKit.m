//
//  UIImageView+NBUIKit.m
//  NBCategory
//
//  Created by 刘彬 on 16/3/15.
//  Copyright © 2016年 NewBee. All rights reserved.
//

#import "UIImageView+NBUIKit.h"
#import "UIImage+NBUIKit.h"

@implementation UIImageView (NBUIKit)

+ (instancetype)nb_imageViewWithSize:(CGSize)size image:(UIImage *)image {
    
    CGRect frame = CGRectZero;
    frame.size.width = (size.width <= 0.0f ? 40.0f : size.width);
    frame.size.height = (size.height <= 0.0f ? 40.0f : size.height);
    
    UIImageView *imageView = [[[self class] alloc] initWithFrame:frame];
    imageView.clipsToBounds = YES;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = image;
    return imageView;
}

/**
 *  一个高宽都为width的imageView
 *
 *  @param width 边框，默认值40
 *
 *  @return imageView
 */
+ (instancetype)nb_imageViewWithWidth:(CGFloat)width {
    return [self nb_imageViewWithSize:CGSizeMake(width, width) image:nil];
}

/**
 *  一个图片
 *
 *  @param size 高宽，默认值CGSize(40,40)
 *
 *  @return imageView
 */
+ (instancetype)nb_imageViewWithSize:(CGSize)size {
    return [self nb_imageViewWithSize:size image:nil];
}

/**
 *  一个图片
 *
 *  @param image 设置的image，大小取image大小
 *
 *  @return imageView
 */
+ (instancetype)nb_imageViewWithImage:(UIImage *)image {
    return [self nb_imageViewWithSize:image.size image:image];
}

/**
 *  一个一像素高度的线，内部根据当前分辨率扩充其透明线
 *
 *  @param width        边框，默认值40
 *  @param color        线的颜色，不能为空
 *  @param orientation  线的方向
 *
 *  @return 一个线的view
 */
+ (instancetype)nb_lineWithWidth:(CGFloat)width color:(UIColor *)color orientation:(UIInterfaceOrientation)orientation {
    
    UIImage *image = [UIImage nb_lineWithColor:color orientation:orientation];
    
    CGRect frame = CGRectZero;
    
    CGFloat aWidth = (width <= 0.0f ? 40.0f : width);
    
    if (UIInterfaceOrientationLandscapeLeft == orientation || UIInterfaceOrientationLandscapeRight == orientation) {
        frame.size.height = aWidth;
        frame.size.width = 1;
    }
    else {
        frame.size.width = aWidth;
        frame.size.height = 1;
    }
    
    UIImageView *imageView = [[[self class] alloc] initWithFrame:frame];
    imageView.clipsToBounds = YES;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = image;
    return imageView;
}

@end
