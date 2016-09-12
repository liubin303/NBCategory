//
//  NBUIKit.h
//  NBCategory
//
//  Created by 刘彬 on 16/3/16.
//  Copyright © 2016年 NewBee. All rights reserved.
//

//#ifndef NBUIKit_h
//#define NBUIKit_h

#define NBUIKit_IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)?YES:NO
#define NBUIKit_IS_Retina (([[UIScreen mainScreen]scale]>1)?YES:NO)

#ifdef __OBJC__
#import "NSObject+AssociatedObjects.h"
#import "UIView+NBUIKit.h"
#import "UILabel+NBUIKit.h"
#import "UIImageView+NBUIKit.h"
#import "UIButton+NBUIKit.h"
#import "UIColor+NBUIKit.h"
#import "UIImage+NBUIKit.h"
#endif


//#endif /* NBUIKit_h */
