
//
//  ShopCollTVCell.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/1/9.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "ShopCollTVCell.h"

@interface ShopCollTVCell ()
/**
 *店铺logo
 */
@property (nonatomic, strong)UIImageView *shopImage;
/**
 *店铺名称
 */
@property (nonatomic, strong)UILabel *nameLabel;
/**
 *店铺等级btn  因为UI没给尺寸 所以用btn来让他自适应大小
 */
@property (nonatomic, strong)UIButton  *levelBtn;
/**
 *编辑
 */
@property (nonatomic, strong)UIButton *morehsBtn;
/**
 *收藏人数
 */
@property (nonatomic, strong)UILabel *collectionNumLabel;
/**
 *找相似
 */
@property (nonatomic, strong)UIButton *similarBtn;
@end

@implementation ShopCollTVCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.shopImage = [UIImageView new];
        _shopImage.image = [UIImage imageNamed:@"zly"];
        [self.contentView addSubview:_shopImage];
        _shopImage.sd_layout.leftSpaceToView (self.contentView, kFit(12)).centerYEqualToView(self.contentView).widthIs(kFit(48)).heightIs(kFit(48));
        
        //三点的按钮
        self.morehsBtn = [UIButton new];
        UIImage *shoppingCartImage = [UIImage imageNamed:@"morehs"];
        //设置图像渲染方式
        shoppingCartImage = [shoppingCartImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//
        [_morehsBtn setImage:shoppingCartImage forState:(UIControlStateNormal)];
        [_morehsBtn addTarget:self action:@selector(handleMorehsBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_morehsBtn];
        _morehsBtn.sd_layout.rightSpaceToView (self.contentView, kFit(2)).widthIs(kFit(42.5)).heightIs(kFit(25)).centerYEqualToView(self.contentView);
        //找相似
        self.similarBtn = [UIButton new];
        [_similarBtn setTitle:@"找相似" forState:(UIControlStateNormal)];
        _similarBtn.layer.cornerRadius = 3;
        _similarBtn.layer.masksToBounds = YES;
        [_similarBtn setTitleColor:kNavigation_Color forState:(UIControlStateNormal)];
        _similarBtn.titleLabel.font = MFont(kFit(12));
        _similarBtn.layer.borderWidth = 0.5;
        _similarBtn.layer.borderColor = [kNavigation_Color CGColor];
        [self.contentView addSubview:_similarBtn];
        [_similarBtn addTarget:self action:@selector(handleSimilarBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        _similarBtn.sd_layout.rightSpaceToView (_morehsBtn, kFit(0)).centerYEqualToView(self.contentView).widthIs(kFit(50)).heightIs(kFit(25));

        self.nameLabel = [UILabel new];
        _nameLabel.text = @"🐊鳄鱼牌沙发";
        _nameLabel.textColor = MColor(51, 51, 51);
        _nameLabel.font =MFont(kFit(12));
        [self.contentView addSubview:_nameLabel];
        _nameLabel.sd_layout.leftSpaceToView (_shopImage, kFit(13)).topEqualToView(_shopImage).rightSpaceToView(_similarBtn, kFit(12)).heightIs(kFit(12));

        UIImage *LevelImage = [UIImage imageNamed:@"vip1"];
        LevelImage = [LevelImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.levelBtn = [UIButton new];
        [_levelBtn setImage:LevelImage forState:(UIControlStateNormal)];
        [self.contentView addSubview:_levelBtn];
        _levelBtn.sd_layout.leftSpaceToView(_shopImage, kFit(13)).widthIs(kFit(25)).heightIs(kFit(15)).topSpaceToView(_nameLabel, kFit(5));
        
        self.collectionNumLabel = [UILabel new];
        _collectionNumLabel.textColor = MColor(161, 161, 161);
        _collectionNumLabel.text = @"已经被收藏3333次";
        _collectionNumLabel.font = MFont(kFit(12));
        [self.contentView addSubview:_collectionNumLabel];
        _collectionNumLabel.sd_layout.leftEqualToView(_nameLabel).topSpaceToView(_levelBtn, kFit(8)).heightIs(kFit(12)).rightSpaceToView(_similarBtn, kFit(12));
        
        UILabel *bottomLabel = [UILabel new];
        bottomLabel.backgroundColor = MColor(238, 238, 238);
        [self.contentView addSubview:bottomLabel];
        bottomLabel.sd_layout.leftSpaceToView(self.contentView, kFit(0)).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, kFit(0)).heightIs(0.5);
    }
    return self;
}


- (void)EditButtonTagAssignment:(NSIndexPath *)indexPaht {
    _morehsBtn.tag = indexPaht.row;
    _similarBtn.tag = indexPaht.row *100;
}
- (void)handleSimilarBtn:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(similarShop:)]) {
        [_delegate similarShop:sender];
    }
}
- (void)handleMorehsBtn:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(collShopEditor:)]) {
        [_delegate collShopEditor:sender];
    }
}

-(void)setModel:(StoreCollectModel *)model {
    _model = model;
    [_shopImage sd_setImageWithURL:[NSString stringWithFormat:@"%@%@", kImage_URL, model.storeLogo] placeholderImage:[UIImage imageNamed:@"jiazaishibai"]];
    _nameLabel.text = model.storeName;
    _collectionNumLabel.text  = [NSString stringWithFormat:@"已经被收藏%@次", model.storeCollect];
}
@end
