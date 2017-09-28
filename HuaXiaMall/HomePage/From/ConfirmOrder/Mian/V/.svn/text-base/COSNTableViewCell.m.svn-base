//
//  COSNTableViewCell.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/16.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "COSNTableViewCell.h"

@implementation COSNTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *grayLabel = [UILabel new];//商家上方灰色部分
        grayLabel.backgroundColor = MColor(238, 238, 238);
        [self.contentView addSubview:grayLabel];
        grayLabel.sd_layout.leftSpaceToView(self.contentView, kFit(0)).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, kFit(0)).heightIs(kFit(10));

        UIButton *iconBtn = [UIButton new];
        UIImage *iconImage = [UIImage imageNamed:@"dp"];
        iconImage = [iconImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        [iconBtn setImage:iconImage forState:(UIControlStateNormal)];
        [self.contentView addSubview:iconBtn];
        iconBtn.sd_layout.leftSpaceToView(self.contentView,kFit(12)).topSpaceToView(grayLabel, 0).widthIs(kFit(24)).bottomSpaceToView(self.contentView, 0);
        
        self.stopName = [UILabel new];
        _stopName.text = @"腾讯课堂";
        _stopName.font = MFont(kFit(17));
        _stopName.textColor = MColor( 51, 51, 51);
        [self.contentView addSubview:_stopName];
        _stopName.sd_layout.leftSpaceToView(iconBtn, kFit(12)).topSpaceToView(grayLabel, kFit(17)).widthIs(kFit(200)).heightIs(kFit(17));
        
        UILabel *segmentationlabel = [UILabel new];
        segmentationlabel.backgroundColor = MColor(210, 210, 210);
        [self.contentView addSubview:segmentationlabel];
        segmentationlabel.sd_layout.leftSpaceToView(self.contentView, kFit(12)).bottomSpaceToView(self.contentView, 0.5).rightSpaceToView(self.contentView, kFit(12)).heightIs(kFit(0.5));
        
    }
    return self;
}
@end
