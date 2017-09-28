//
//  IRTVCell.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/15.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "IRTVCell.h"

@implementation IRTVCell


//@property (nonatomic, strong)UILabel *StoreName;

//@property (nonatomic, strong)UIImageView *StoreImage;

//@property (nonatomic, strong)UILabel *GoodsName;

//@property (nonatomic, strong)UILabel *IntegralNumber;

//@property (nonatomic, strong)UILabel *instructionsLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.StoreImage = [UIImageView new];
        self.StoreImage.image = [UIImage imageNamed:@"zly"];
        _StoreImage.layer.cornerRadius = 6;
        _StoreImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_StoreImage];
        _StoreImage.sd_layout.leftSpaceToView(self.contentView, kFit(12)).topSpaceToView(self.contentView, kFit(25)).widthIs(kFit(53)).heightIs(kFit(53));
        
        
        self.IntegralNumber = [UILabel new];
        _IntegralNumber.text = @"+ 50000";
        _IntegralNumber.textAlignment = 2;
        _IntegralNumber.textColor = kNavigation_Color;
        _IntegralNumber.font =MFont(kFit(15));
        [self.contentView addSubview:_IntegralNumber];
        _IntegralNumber.sd_layout.rightSpaceToView(self.contentView, kFit(12)).widthIs(kFit(110)).topSpaceToView(self.contentView, kFit(32)).heightIs(kFit(15));
        
        self.instructionsLabel = [UILabel new];
        _instructionsLabel.textAlignment = 2;
        _instructionsLabel.text = @"交易成功送积分";
        _instructionsLabel.textColor = MColor(134, 134, 134);
        _instructionsLabel.font = MFont(kFit(12));
        [self.contentView addSubview:_instructionsLabel];
        _instructionsLabel.sd_layout.rightSpaceToView(self.contentView, kFit(12)).widthIs(kFit(110)).topSpaceToView(_IntegralNumber, kFit(12)).heightIs(kFit(12));
        
        self.StoreName = [UILabel new];
        _StoreName.text = @"零软家具城";
        _StoreName.textColor = MColor(51, 51, 51);
        _StoreName.font = MFont(kFit(15));
        [self.contentView addSubview:_StoreName];
        _StoreName.sd_layout.leftSpaceToView(_StoreImage, kFit(15)).topSpaceToView(self.contentView, kFit(32)).rightSpaceToView(self.IntegralNumber, kFit(15)).heightIs(kFit(15));
         self.GoodsName = [UILabel new];
        _GoodsName.text = @"🐊鳄鱼牌沙发";
        _GoodsName.textColor = MColor(134, 134, 134);
        _GoodsName.font = MFont(kFit(14));
        [self.contentView addSubview:_GoodsName];
        _GoodsName.sd_layout.leftSpaceToView(self.StoreImage, kFit(15)).topSpaceToView(self.StoreName, kFit(10)).rightSpaceToView(self.instructionsLabel, kFit(15)).heightIs(kFit(14));
        
        UILabel *segmentationLabel = [UILabel new];
        segmentationLabel.backgroundColor = MColor(210, 210, 210);
        [self.contentView addSubview:segmentationLabel];
        segmentationLabel.sd_layout.leftSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0.5).rightSpaceToView(self.contentView, 0).heightIs(0.5);
    }
    return self;
}

- (void)IntegralType:(NSDictionary *)describe type:(int)type {
    _IntegralNumber.text = describe[@"IntegralNumber"];
    _instructionsLabel.text = describe[@"instructionsLabel"];
    switch (type) {
        case 0:
            _IntegralNumber.textColor = kNavigation_Color;
            break;
        case 1:
            _IntegralNumber.textColor = MColor(255, 51, 52);
            break;
        case 2:
            _StoreImage.image = [UIImage imageNamed:@"wd-jfjl-jftx"];
            _StoreName.text = @"积分提现";
            _GoodsName.text = @"金额:￥1000";
            _IntegralNumber.textColor = MColor(255, 51, 52);
            
            break;
            
        default:
            break;
    }
}

@end
