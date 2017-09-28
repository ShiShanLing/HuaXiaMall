//
//  HWInstallView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/18.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "HWInstallView.h"

#define KHWInstallViewMargin 10
#define KHWInstallColor MColor(242, 242, 242)

@implementation HWInstallView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kOrange_Color;
        
    }
    
    return self;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    self.layer.cornerRadius = xCenter;
    self.layer.masksToBounds = YES;
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.54 ;
    //背景遮罩
        [KHWInstallColor set];
    CGFloat lineW = MAX(rect.size.width, rect.size.height) * 0.5;
    CGContextSetLineWidth(context, lineW);
    CGContextAddArc(context, xCenter, yCenter, radius + lineW * 0.5 + 5, 0, M_PI * 2, 1);
    CGContextStrokePath(context);
    
    //进程圆
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, xCenter, yCenter);
    CGContextAddLineToPoint(context, xCenter, 0);
    CGFloat endAngle = - M_PI * 0.5 + _progress * M_PI * 2 + 0.001;
    CGContextAddArc(context, xCenter, yCenter, radius, - M_PI * 0.5, endAngle, 1);
    CGContextFillPath(context);
}

@end

