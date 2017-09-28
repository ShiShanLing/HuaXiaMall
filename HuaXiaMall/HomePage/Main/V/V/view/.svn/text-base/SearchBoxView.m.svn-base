//
//  SearchBoxView.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/27.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "SearchBoxView.h"

@implementation SearchBoxView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        

        
         self.titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.text = @"请输入您想搜索的商品";
        _titleLabel.textColor = MColor(168, 168, 168);
        _titleLabel.font = MFont(kFit(14));
        [self addSubview:_titleLabel];
        
        NSString *title = @"请输入您想搜索的商品";
       CGFloat width = [title getWidthWithTitleFont:MFont(kFit(14))];
        _titleLabel.sd_layout.topSpaceToView(self, 0).bottomSpaceToView(self, 0).centerXEqualToView(self).widthIs(width);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tap];
        
        UIImageView *searchImage = [UIImageView new];
        searchImage.image = [UIImage imageNamed:@"ss"];
        [self addSubview:searchImage];
        searchImage.sd_layout.rightSpaceToView(_titleLabel, kFit(10)).topSpaceToView(self, 8).widthIs(18).autoHeightRatio(1);
    }
    return self;
}




- (void)handleTap:(UITapGestureRecognizer *)tap {

    if ([_Delegate respondsToSelector:@selector(SearchJump)]) {
        [_Delegate SearchJump];
    }

}


@end
