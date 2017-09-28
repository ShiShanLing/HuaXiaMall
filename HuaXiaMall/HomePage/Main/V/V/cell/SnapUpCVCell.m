//
//  SnapUpCVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/18.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "SnapUpCVCell.h"

@interface SnapUpCVCell()

@property (nonatomic, strong)UIImageView *titleImageView;

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UIButton *editorBtn;

@property (nonatomic, strong)UIButton *goodsImageBtn;

@end

@implementation SnapUpCVCell

-(instancetype)initWithFrame:(CGRect)frame {
    self= [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.titleImageView = [UIImageView new];
        _titleImageView.image = [UIImage imageNamed:@"qgzc_1"];
        [self.contentView addSubview:_titleImageView];
        _titleImageView.sd_layout.leftSpaceToView(self.contentView, kFit(10)).centerYEqualToView(self.contentView).widthIs(kFit(39)).autoHeightRatio(1.0);
        
        UILabel *dividerLabel = [UILabel new];
        dividerLabel.backgroundColor = MColor(152, 152, 152);
        [self.contentView addSubview:dividerLabel];
        dividerLabel.sd_layout.leftSpaceToView(_titleImageView, kFit(12)).heightIs(kFit(45)).centerYEqualToView(self.contentView).widthIs(kFit(1));
        
        self.titleLabel = [UILabel new];
        _titleLabel.text = @"多线程精品图书";//23个字符
        [_titleLabel sizeToFit];
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.numberOfLines = 2;
        _titleLabel.textColor = MColor(255, 143, 0);
        _titleLabel.font = MFont(kFit(14));
        [self.contentView addSubview:_titleLabel];
        _titleLabel.sd_layout.leftSpaceToView(dividerLabel, kFit(12)).heightIs(kFit(36)).widthIs(kFit(167)).centerYEqualToView(self.contentView);
        
        self.editorBtn = [UIButton new];
        [_editorBtn setTitle:@"去抢" forState:(UIControlStateNormal)];
        [_editorBtn setTitleColor:MColor(161, 161, 161) forState:(UIControlStateNormal)];
        _editorBtn.titleLabel.font = MFont(kFit(14));
        [self.contentView addSubview:_editorBtn];
        _editorBtn.sd_layout.leftSpaceToView(_titleLabel, kFit( - 30)).bottomEqualToView(_titleLabel).heightIs(kFit(15)).widthIs(kFit(30));
        
        self.goodsImageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        UIImage *btnImage = [[UIImage imageNamed:@"jingtian"]imageByScalingAndCroppingForSize:CGSizeMake(kFit(101), kFit(61))];
        [_goodsImageBtn setBackgroundImage:btnImage  forState:UIControlStateNormal];
        [self.contentView addSubview:_goodsImageBtn];
        _goodsImageBtn.sd_layout.leftSpaceToView(_titleLabel, kFit(25)).heightIs(kFit(61)).rightSpaceToView(self.contentView, kFit(10)).centerYEqualToView(self.contentView);
        
    }
    return self;
}

@end
