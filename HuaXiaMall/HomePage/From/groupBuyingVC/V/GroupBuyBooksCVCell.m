//
//  GroupBuyBooksCVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/23.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "GroupBuyBooksCVCell.h"

@implementation GroupBuyBooksCVCell
-(instancetype)initWithFrame:(CGRect)frame {
    self= [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self CreatingControls];
        
    }
    return self;
}
- (void)CreatingControls {
    self.goodsImage = [UIImageView new];
    [_goodsImage sd_setImageWithURL:@"http://i4.cqnews.net/news/attachement/jpg/site82/2016-08-23/9143505007648195979.jpg"];
    [_goodsImage.image imageByScalingAndCroppingForSize:CGSizeMake(self.contentView.width, self.contentView.width)];
    [self.contentView addSubview:_goodsImage];
    _goodsImage.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).autoHeightRatio(1.0);
    
    self.goodsName = [UILabel new];
    _goodsName.text = @"专业的专业的专业的专业的专业的专业的专业的专业的专业的专业的专业的专业的专业的!";
    _goodsName.numberOfLines = 0;
    _goodsName.lineBreakMode = UILineBreakModeWordWrap;
    _goodsName.font = MFont(kFit(12));
    [self.contentView addSubview:_goodsName];
    _goodsName.sd_layout.leftSpaceToView(self.contentView, kFit(5)).rightSpaceToView(self.contentView, kFit(10)).topSpaceToView(_goodsImage, 5).heightIs(kFit(30));
    
    self.searchBtn = [CustomBtn new];
    _searchBtn.font = MFont(kFit(12));
    [_searchBtn setTitleColor:MColor(150, 150, 150) forState:(UIControlStateNormal)];
    [_searchBtn setTitle:@"已售3000份" forState:(UIControlStateNormal)];
    [self.contentView addSubview:_searchBtn];
    _searchBtn.sd_layout.topSpaceToView(_goodsName, 5).rightSpaceToView(self.contentView, 5).widthIs(70).bottomSpaceToView(self.contentView, 5);
    
    self.goodsOriginalPrice = [UILabel new];
    _goodsOriginalPrice.text = @"￥:100.00";
    _goodsOriginalPrice.font = MFont(kFit(11));
    _goodsOriginalPrice.textColor = MColor(255, 40, 40);
    [self.contentView addSubview:_goodsOriginalPrice];
    _goodsOriginalPrice.sd_layout.leftSpaceToView(self.contentView,5).bottomSpaceToView(self.contentView, kFit(10)).heightIs(kFit(11)).widthIs(kFit(55));
    
    self.goodsPresentPrice = [UILabel new];
    _goodsPresentPrice.font = MFont(kFit(9));
    _goodsPresentPrice.textColor = MColor(150, 150, 150);
    NSString *PresentPriceStr = @"￥:110.00";
   NSAttributedString *attrStr = [PresentPriceStr stringAddRemoveLine];
    _goodsPresentPrice.attributedText = attrStr;
    [self.contentView addSubview:_goodsPresentPrice];
    _goodsPresentPrice.sd_layout.leftSpaceToView(_goodsPresentPrice,8).bottomSpaceToView(self.contentView, kFit(10)).heightIs(kFit(9)).widthIs(kFit(55));

    
}

@end
