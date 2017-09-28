//
//  GoodsRecCViewCell.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/1.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "GoodsRecCViewCell.h"

@interface GoodsRecCViewCell ()



@end

@implementation GoodsRecCViewCell

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
    _searchBtn.font = MFont(kFit(13));
    _searchBtn.layer.borderWidth = 1;
    _searchBtn.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor redColor]);
    _searchBtn.layer.cornerRadius = 3;
    _searchBtn.layer.masksToBounds = YES;
    _searchBtn.backgroundColor = [UIColor redColor];
    [_searchBtn setTitle:@"分享" forState:(UIControlStateNormal)];
    [_searchBtn addTarget:self action:@selector(handleShare:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.contentView addSubview:_searchBtn];
    _searchBtn.sd_layout.topSpaceToView(_goodsName, 5).rightSpaceToView(self.contentView, 5).widthIs(50).autoHeightRatio(0.5).bottomSpaceToView(self.contentView, 5).topSpaceToView(_goodsName, 5);
    
    self.goodsPrice = [UILabel new];
    _goodsPrice.text = @"￥:100.00";
    _goodsPrice.font = MFont(kFit(13));
    _goodsPrice.textColor = [UIColor redColor];
    [self.contentView addSubview:_goodsPrice];
    _goodsPrice.sd_layout.leftSpaceToView(self.contentView,5).bottomSpaceToView(self.contentView, 10).heightIs(20).rightSpaceToView(_searchBtn, 15);
}

- (void)handleShare:(CustomBtn *)sender {
    if ([_delegate respondsToSelector:@selector(ShareGoodsSubscript:)]) {
        [_delegate ShareGoodsSubscript:sender.indexPath];
    }
}

- (void)ToControlsAssignment:(NSIndexPath *)indexPath {

    _searchBtn.indexPath = indexPath;

}

-(void)setModel:(GoodsDetailsModel *)model {

    [_goodsImage setImageViewAssignmentURL:[NSString stringWithFormat:@"%@%@", kImage_URL, model.goodsImage] imageName:@"hashiqi1"];
    NSLog(@"%@", [NSString stringWithFormat:@"%@%@", kImage_URL, model.goodsImage]);
    _goodsName.text = model.goodsName;
    _goodsPrice.text = [NSString stringWithFormat:@"¥:%.2f", model.goodsStorePrice];
    
}


@end
