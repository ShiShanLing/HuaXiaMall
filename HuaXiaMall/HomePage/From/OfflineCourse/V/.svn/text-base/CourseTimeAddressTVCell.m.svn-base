//
//  CourseTimeAddressTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/14.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "CourseTimeAddressTVCell.h"

@interface CourseTimeAddressTVCell ()
/**
 *标题label
 */
@property (nonatomic, strong)UILabel *titleLabel;
/**
 *内容视图
 */
@property (nonatomic, strong) UILabel *contentLablel;

@end

@implementation CourseTimeAddressTVCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *TOPLabel = [[UILabel alloc] init];
        TOPLabel.backgroundColor = MColor(242, 242, 242);
        [self.contentView addSubview:TOPLabel];
        TOPLabel.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(1);
        
        self.titleLabel = [UILabel new];
        _titleLabel.text = @"学习时间";
        _titleLabel.textColor = MColor(102, 102, 102);
        _titleLabel.font = MFont(kFit(13));
        [self.contentView addSubview:_titleLabel];
        
        _titleLabel.sd_layout.leftSpaceToView(self.contentView, kFit(10)).centerYEqualToView(self.contentView).widthIs(kFit(55)).heightIs(kFit(15));
        self.contentLablel = [UILabel new];
        _contentLablel.text = @"2017-8-19 - 2018-6-12";
        _contentLablel.textColor = MColor(102, 102, 102);
        _contentLablel.font = MFont(kFit(11));
        [self.contentView addSubview:_contentLablel];
        _contentLablel.sd_layout.leftSpaceToView(_titleLabel, kFit(10)).centerYEqualToView(self.contentView).rightSpaceToView(self.contentView, 10).heightIs(kFit(15));
    }
    return self;

}
@end
