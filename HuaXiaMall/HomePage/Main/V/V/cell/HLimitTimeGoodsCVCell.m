//
//  HLimitTimeGoodsCVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/11.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "HLimitTimeGoodsCVCell.h"

@interface HLimitTimeGoodsCVCell ()

@property (weak, nonatomic) IBOutlet UIImageView *GoodsImageView;


@end

@implementation HLimitTimeGoodsCVCell
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.GoodsImageView.image = [UIImage imageNamed:@"jingtian"];
    }
    return self;
}

@end
