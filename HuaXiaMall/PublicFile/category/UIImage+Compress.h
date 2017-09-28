//
//  UIImage+Compress.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/18.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>
//图片压缩
@interface UIImage (Compress)
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;



@end
