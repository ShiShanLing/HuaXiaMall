//
//  OrderEmptyCVCell.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/1/12.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "OrderEmptyCVCell.h"

@implementation OrderEmptyCVCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *titleView = [UIImageView new];
        titleView.image = [UIImage imageNamed:@"mydd"];
        [self.contentView addSubview:titleView];
        titleView.sd_layout.topSpaceToView(self.contentView, kFit(107)).widthIs(kFit(70)).heightIs(kFit(70)).centerXEqualToView(self.contentView);
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.textAlignment = 1;
        titleLabel.text = @"您还没有相关的订单";
        titleLabel.font = MFont(kFit(17));
        titleLabel.textColor = MColor(0, 0, 0);
        [self.contentView addSubview:titleLabel];
        titleLabel.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(titleView, kFit(35)).heightIs(kFit(17));
        
        UILabel *subheadLabel = [UILabel new];
        subheadLabel.textColor= MColor(161, 161, 161);
        subheadLabel.text = @"可以去看看有哪些想买的";
        subheadLabel.textAlignment = 1;
        subheadLabel.font = MFont(kFit(11));
        [self.contentView addSubview:subheadLabel];
        subheadLabel.sd_layout.leftSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).topSpaceToView(titleLabel, kFit(35)).heightIs(kFit(11));
        
    }
    return self;

}

@end
