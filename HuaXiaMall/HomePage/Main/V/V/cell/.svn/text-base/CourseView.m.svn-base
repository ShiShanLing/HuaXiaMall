//
//  CourseView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/16.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "CourseView.h"
#define kView3_4_5_width  (kScreen_widht- kFit(30))/3
@implementation CourseView

-(instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        self.showImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textimage.jpg"]];
        
        [self addSubview:_showImage];
        _showImage.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).autoHeightRatio(0.56);
        
        
        self.CouresStateBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_CouresStateBtn setImage:[UIImage imageNamed:@"OfflineCourse"] forState:(UIControlStateNormal)];
        [self addSubview:_CouresStateBtn];
        _CouresStateBtn.sd_layout.leftSpaceToView(self, 0).topSpaceToView(_showImage, 3).widthIs(kFit(26)).heightIs(kFit(18));
        
        self.goodsName = [UILabel new];
        _goodsName.text = @"iOS开发教学视频";
        _goodsName.font = MFont(kFit(11));
        _goodsName.textColor = MColor(51, 51, 51);
        
        [self addSubview:_goodsName];
        _goodsName.sd_layout.leftSpaceToView(_CouresStateBtn, 3).topSpaceToView(_showImage, kFit(5)).rightSpaceToView(self, 0).heightIs(kFit(11));
        
        self.goodspriceLabel = [UILabel new];
        _goodspriceLabel.text = @"¥:500,500.30";
        _goodspriceLabel.font = MFont(kFit(9));
        _goodspriceLabel.textColor = MColor(255, 40, 40);
        [self addSubview:_goodspriceLabel];
        _goodspriceLabel.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, kFit(0)).widthIs(self.frame.size.width/2).heightIs(kFit(10));
        
        self.beBuyNumLabel = [UILabel new];
        _beBuyNumLabel.text = @"501人参与学习";
        _beBuyNumLabel.font = MFont(kFit(9));
        _beBuyNumLabel.textAlignment = 2;
        _beBuyNumLabel.textColor = MColor(255, 40, 40);
        [self addSubview:_beBuyNumLabel];
        _beBuyNumLabel.sd_layout.rightSpaceToView(self, 0).bottomSpaceToView(self, kFit(0)).widthIs(self.frame.size.width/2).heightIs(kFit(10));
        
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
        [self addGestureRecognizer:tapG];
    }
 return  self;
}
- (void)DetermineControlSizeFont:(CGFloat)size viewWidht:(CGFloat)width {
    _goodsName.font = MFont(kFit(size));
    _goodspriceLabel.font = MFont(kFit(size-1));
    _beBuyNumLabel.font = MFont(kFit(size-1));
    _goodspriceLabel.sd_layout.leftSpaceToView(self, 0).bottomSpaceToView(self, kFit(0)).widthIs(width/2).heightIs(kFit(10));
    _beBuyNumLabel.sd_layout.rightSpaceToView(self, 0).bottomSpaceToView(self, kFit(0)).widthIs(width/2).heightIs(kFit(10));
}


- (void)handleTap {
    if ([_delegate respondsToSelector:@selector(viewClickEvent:)]) {
        [_delegate viewClickEvent:self];
    }
}

@end
