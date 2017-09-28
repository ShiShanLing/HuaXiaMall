//
//  CircleView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/9.
//  Copyright © 2017年 石山岭. All rights reserved.
//


#import "XLCircleProgress.h"
#import "XLCircle.h"

@implementation XLCircleProgress
{
    XLCircle* _circle;
    UILabel *_percentLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}


-(void)initUI {
    float lineWidth = 0.1*self.bounds.size.width;
    _percentLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _percentLabel.textColor = MColor(255, 143, 0);
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.font = [UIFont boldSystemFontOfSize:kFit(9)];
    _percentLabel.text = @"0%";
    [self addSubview:_percentLabel];
    _circle = [[XLCircle alloc] initWithFrame:self.bounds lineWidth:lineWidth];
    [self addSubview:_circle];
    
}
#pragma mark Setter方法
-(void)setProgress:(float)progress
{
    _progress = progress;
    _circle.progress = progress;
    _percentLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
}

@end
