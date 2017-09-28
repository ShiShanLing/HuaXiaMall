//
//  SericeView.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/10.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "SericeView.h"

@implementation SericeView

-(instancetype)initWithFrame:(CGRect)frame {
    self  = [super initWithFrame:frame];
    if (self) {
        
        UIButton *btn = [UIButton new];
        [btn setImage:[UIImage imageNamed:@"zbfw"] forState:(UIControlStateNormal)];
        [self addSubview:btn];
        btn.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).heightIs(self.frame.size.height).widthIs(kFit(self.frame.size.height));
        
        self.nameLabel = [UILabel new];
        self.nameLabel.text = @"全国包邮";
        self.nameLabel.textAlignment = 0;
        _nameLabel.numberOfLines = 0;
        self.nameLabel.font = MFont(kFit(14));
        [self addSubview:self.nameLabel];
        self.nameLabel.sd_layout.leftSpaceToView(btn, kFit(0)).topSpaceToView(self, 0).heightIs(self.size.height).rightSpaceToView(self, 0);

    }
    return self;

}
@end
