//
//  CommentsTitleTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/13.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "CommentsTitleTVCell.h"

@interface CommentsTitleTVCell ()


@property (nonatomic, strong)UILabel *segmentationLabel;

@end

@implementation CommentsTitleTVCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *titleView = [[UIView alloc] init];
        titleView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:titleView];
        titleView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(kFit(34));
        
        UILabel *segmentationLabel = [[UILabel alloc] init];
        segmentationLabel.backgroundColor = MColor(242, 242, 242);
        segmentationLabel.text = @"学员评论(105)";
        [titleView addSubview:segmentationLabel];
        segmentationLabel.sd_layout.leftSpaceToView(titleView, 0).bottomSpaceToView(titleView, 0).heightIs(kFit(1)).rightSpaceToView(titleView, 0);
        self.segmentationLabel = segmentationLabel;
        
        
        UIButton *arrowBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [arrowBtn setImage:[UIImage imageNamed:@"qbddjt"] forState:(UIControlStateNormal)];
        [arrowBtn addTarget:self action:@selector(handleMoreMore) forControlEvents:(UIControlEventTouchUpInside)];
        [titleView addSubview:arrowBtn];
        arrowBtn.sd_layout.rightSpaceToView(titleView, 0).centerYEqualToView(titleView).widthIs(40).heightIs(34);
        UIButton *MoreMoreBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [MoreMoreBtn setTitle:@"查看更多" forState:(UIControlStateNormal)];
        MoreMoreBtn.titleLabel.font = MFont(kFit(14));
        [MoreMoreBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [MoreMoreBtn addTarget:self action:@selector(handleMoreMore) forControlEvents:(UIControlEventTouchUpInside)];
        [titleView addSubview:MoreMoreBtn];
        MoreMoreBtn.sd_layout.rightSpaceToView(arrowBtn, 0).centerYEqualToView(titleView).widthIs(60).heightIs(34);
    }
    return self;
}

@end
