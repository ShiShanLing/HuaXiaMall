//
//  UIImageView+Extension.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/21.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "UIImageView+Extension.h"
#import <ImageIO/ImageIO.h>
@implementation UIImageView (Extension)
- (CGRect)imageSizeAdaptive:(CGSize)size imageURL:(NSURL *)url{
    NSData * centerData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:centerData];
    CGSize fixelSize;
    fixelSize.width = CGImageGetWidth(image.CGImage);
    fixelSize.height = CGImageGetHeight(image.CGImage);
    CGFloat W = size.width / fixelSize.width;
    CGFloat imageNewW = W * fixelSize.width;
    CGFloat imageNewH = W * fixelSize.height;
    CGRect  tempFrame= CGRectMake(0, 0, 0, 0);
    CGFloat TempScale;
    if (imageNewH > size.height) {
        CGFloat H = size.height / fixelSize.height;
        TempScale = H;
        tempFrame.size.height = fixelSize.height * H;
        tempFrame.size.width = fixelSize.width *H;
        tempFrame.origin.x = (size.width - tempFrame.size.width) / 2;
    }else {
        tempFrame.size = fixelSize;
        tempFrame.origin.y = (size.height - imageNewH)/2;
    }
    return tempFrame;
}

- (void)setImageViewAssignmentURL:(NSString *)url imageName:(NSString *)image{
    UIImage *tempImage = [UIImage imageNamed:image];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:tempImage];
    
}
- (void)setImageViewGifName:(NSString *)str {
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:str withExtension:@"gif"]; //加载GIF图片
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef) fileUrl, NULL);           //将GIF图片转换成对应的图片源
    size_t frameCout = CGImageSourceGetCount(gifSource);
    
    //获取其中图片源个数，即由多少帧图片组成
    NSMutableArray *frames = [[NSMutableArray alloc] init];                                      //定义数组存储拆分出来的图片
    for (size_t i = 0; i < frameCout; i++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(gifSource, i, NULL); //从GIF图片中取出源图片
        UIImage *imageName = [UIImage imageWithCGImage:imageRef];                  //将图片源转换成UIimageView能使用的图片源
        [frames addObject:imageName];                                              //将图片加入数组中
        CGImageRelease(imageRef);
    }
    
    self.animationImages = frames; //将图片数组加入UIImageView动画数组中
    self.animationDuration = 5.5; //每次动画时长
    [self startAnimating];         //开启动画，此处没有调用播放次数接口，UIImageView默认播放次数为无限次，故这里不做处理



}
@end
