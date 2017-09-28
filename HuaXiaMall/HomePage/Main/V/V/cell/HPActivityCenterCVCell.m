//
//  HPActivityCenterCVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/10.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "HPActivityCenterCVCell.h"
#import "HomePageIconView.h"
@interface HPActivityCenterCVCell ()<HomePageIconViewDelegate>

@property (nonatomic, strong)NSMutableArray *imageArray;
@property (nonatomic, strong)UILabel *subtitleLabelOne;
@property (nonatomic, strong)UILabel *subtitleLabelTwo;

@end

@implementation HPActivityCenterCVCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        NSArray *iocnArray = @[@"spkc", @"jxsj", @"tgth", @"xylt", @"zxrd"];
        NSArray *titeArray = @[@"视频课程", @"精选书籍", @"团购特惠", @"学员论坛", @"咨询热点"];
        CGFloat left = kFit(5);
        for (int i =0; i < 5; i ++) {
            HomePageIconView *icon = [HomePageIconView new];
            icon.nameLable.text = titeArray[i];
            icon.tag = 100 + i;
            icon.delegate = self;
            if (i == 0) {
                
            }else {
                left = i * (17.5+ 59);
            }
            [icon.iconBtn setImage:[UIImage imageNamed:iocnArray[i]] forState:(UIControlStateNormal)];
            [self.contentView addSubview:icon];
            
            icon.sd_layout.leftSpaceToView(self.contentView, kFit(left)).widthIs(kFit(59)).heightIs(kFit(74)).topSpaceToView(self.contentView, kFit(116)+5);
        }
     
        UIImageView *logoImage = [[UIImageView alloc] init];
        logoImage.image = [UIImage imageNamed:@"mall"];
        [self.contentView addSubview:logoImage];
        logoImage.sd_layout.leftSpaceToView(self.contentView, kFit(10)).topSpaceToView(self.contentView, kFit(116 + 74) + 10).widthIs(kFit(40)).heightIs(kFit(40));
        
        UILabel *titleLabelOne = [[UILabel alloc] init];
        titleLabelOne.layer.cornerRadius = 3;
        titleLabelOne.layer.masksToBounds = YES;
        titleLabelOne.layer.borderWidth = 1.0;
        titleLabelOne.layer.borderColor = kNavigation_Color.CGColor;
        titleLabelOne.textColor = kNavigation_Color;
        titleLabelOne.text = @"热议";
        titleLabelOne.textAlignment = 1;
        titleLabelOne.font = MFont(kFit(12));
        [self.contentView addSubview:titleLabelOne];
        titleLabelOne.sd_layout.leftSpaceToView(logoImage, kFit(15)).topEqualToView(logoImage).widthIs(30).heightIs(17);
        
        UILabel *titleLabelTwo = [[UILabel alloc] init];
        titleLabelTwo.layer.cornerRadius = 3;
        titleLabelTwo.layer.masksToBounds = YES;
        titleLabelTwo.layer.borderWidth = 1.0;
        titleLabelTwo.layer.borderColor = kNavigation_Color.CGColor;
        titleLabelTwo.textColor = kNavigation_Color;
        titleLabelTwo.text = @"热点";
        titleLabelTwo.textAlignment = 1;
        titleLabelTwo.font = MFont(kFit(12));
        [self.contentView addSubview:titleLabelTwo];
        titleLabelTwo.sd_layout.leftSpaceToView(logoImage, kFit(15)).bottomEqualToView(logoImage).widthIs(30).heightIs(17);
        
        self.subtitleLabelOne = [UILabel new];
        _subtitleLabelOne.text = @"精品商品唯你独享!";
        _subtitleLabelOne.textColor = MColor(51, 51, 51);
        _subtitleLabelOne.font = MFont(kFit(10));
        [self.contentView addSubview:_subtitleLabelOne];
        _subtitleLabelOne.sd_layout.leftSpaceToView(titleLabelOne, kFit(10)).topEqualToView(titleLabelOne).heightIs(kFit(17)).rightSpaceToView((self.contentView), 12);
        
        self.subtitleLabelTwo = [UILabel new];
        _subtitleLabelTwo.text = @"超值课程伴您成长!";
        _subtitleLabelTwo.textColor = MColor(51, 51, 51);
        _subtitleLabelTwo.font = MFont(kFit(10));
        [self.contentView addSubview:_subtitleLabelTwo];
        _subtitleLabelTwo.sd_layout.leftSpaceToView(titleLabelTwo, kFit(10)).topEqualToView(titleLabelTwo).heightIs(kFit(17)).rightSpaceToView((self.contentView), 12);
        
    }
    return self;
}

- (void)HomePageIconViewChoose:(HomePageIconView *)view {
    
    if ([_delegate respondsToSelector:@selector(HotModuleClickEvent:)]) {
        [_delegate HotModuleClickEvent:view.tag];
    }
}
@end
