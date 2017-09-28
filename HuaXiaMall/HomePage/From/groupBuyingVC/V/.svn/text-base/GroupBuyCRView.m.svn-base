//
//  GroupBuyCRView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/22.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "GroupBuyCRView.h"

@interface GroupBuyCRView ()



@end

@implementation GroupBuyCRView

-(instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = MColor(242, 242, 242);
        UIView *underlyingView = [[UIView alloc] init];
        underlyingView.backgroundColor = [UIColor whiteColor];
        [self addSubview:underlyingView];
        underlyingView.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, kFit(3));
        
        UIButton *iocnBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [iocnBtn setImage:[UIImage imageNamed:@"tgth-1"] forState:(UIControlStateNormal)];
        [underlyingView addSubview:iocnBtn];
        iocnBtn.sd_layout.leftSpaceToView(underlyingView, 0).widthIs(kFit(39)).topSpaceToView(underlyingView, 0).bottomSpaceToView(underlyingView, 0);
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"团购特惠";
        titleLabel.font = MFont(kFit(12));
        titleLabel.textColor = kOrange_Color;
        [underlyingView addSubview:titleLabel];
        titleLabel.sd_layout.leftSpaceToView(iocnBtn, 0).topSpaceToView(underlyingView, 0).bottomSpaceToView(underlyingView, 0).widthIs(kFit(100));
        
        self.CountDownView = [CZCountDownView shareCountDown];
        _CountDownView.timestamp = 10000;
        _CountDownView.timerStopBlock = ^{
            NSLog(@"时间停止");
        };
        [underlyingView addSubview:_CountDownView];
        _CountDownView.sd_layout.rightSpaceToView(underlyingView, kFit(10)).centerYEqualToView(underlyingView).widthIs(kFit(61)).heightIs(kFit(15));
        
        UILabel *subtitleLabel = [[UILabel alloc] init];
        subtitleLabel.text = @"距离结束时间";
        subtitleLabel.textAlignment = 2;
        subtitleLabel.font = MFont(kFit(12));
        subtitleLabel.textColor = MColor(152, 152, 152);
        [underlyingView addSubview:subtitleLabel];
        subtitleLabel.sd_layout.rightSpaceToView(_CountDownView, 0).topSpaceToView(underlyingView, 0).bottomSpaceToView(underlyingView, 0).widthIs(kFit(120));

    }
    return self;
}


@end
