//
//  iconView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/6.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "HomePageIconView.h"

@implementation HomePageIconView

- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.iconBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _iconBtn.userInteractionEnabled = NO;
        [self addSubview:self.iconBtn];
        _iconBtn.sd_layout.leftSpaceToView(self, kFit(0)).rightSpaceToView(self, kFit(0)).topSpaceToView(self, kFit(0)).autoHeightRatio(1.0);
        self.nameLable = [[UILabel alloc] init];
        self.nameLable.textAlignment = 1;
        self.nameLable.font = [UIFont systemFontOfSize:kFit(11)];
        [self addSubview:self.nameLable];
        _nameLable.sd_layout.leftSpaceToView(self, kFit(0)).rightSpaceToView(self, kFit(0)).topSpaceToView(self.iconBtn, 0).bottomSpaceToView(self, kFit(0));
        UITapGestureRecognizer * tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)handleTap:(HomePageIconView *)tap {
    if ([_delegate respondsToSelector:@selector(HomePageIconViewChoose:)]) {
        [_delegate HomePageIconViewChoose:self];
    }
}

@end
