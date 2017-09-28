//
//  UIImageView+Extension.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/21.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)
/**
 *根据传入的CGSize 来压缩图片 结果为 图片不变形 并且能过完全展示出来
 */
- (CGRect)imageSizeAdaptive:(CGSize)size imageURL:(NSURL *)url;
/**
 *给一个链接 和默认图片
 */
- (void)setImageViewAssignmentURL:(NSString *)url imageName:(NSString *)image;
/**
 *在UIImageView上面播放gif图
 */
- (void)setImageViewGifName:(NSString *)str;

@end
