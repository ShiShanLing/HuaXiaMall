//
//  StudentsCommentTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/13.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "StudentsCommentTVCell.h"

@interface StudentsCommentTVCell ()
/**
 *评论的用户头像
 */
@property (nonatomic, strong)UIImageView *HeadPortraitImage;
/**
 *用户昵称 只显示第一个字
 */
@property (nonatomic, strong)UILabel *userNameLabel;
/**
 *评论的星星
 */
@property (nonatomic, strong)FBCScoreStar *start;

/**
 *学习进度
 */
@property (nonatomic, strong) UILabel *studyProgressLabel;
/**
 *
 */
@property (nonatomic, strong) UILabel *timeLabel;
@end

@implementation StudentsCommentTVCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *TOPLabel = [[UILabel alloc] init];
        TOPLabel.backgroundColor = MColor(242, 242, 242);
        [self.contentView addSubview:TOPLabel];
        TOPLabel.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(1);
        
        self.HeadPortraitImage = [UIImageView new];
        _HeadPortraitImage.image = [UIImage imageNamed:@"erha"];
        [self.contentView addSubview:_HeadPortraitImage];
        _HeadPortraitImage.sd_layout.leftSpaceToView(self.contentView, kFit(10)).topSpaceToView(self.contentView, kFit(16)).widthIs(kFit(45)).heightIs(kFit(45));
        
        self.userNameLabel = [UILabel new];
        _userNameLabel.text = @"石**";
        _userNameLabel.font = MFont(kFit(14));
        _userNameLabel.textColor = MColor(51, 51, 51);
        [self.contentView addSubview:_userNameLabel];
        _userNameLabel.sd_layout.leftSpaceToView(_HeadPortraitImage, kFit(19)).centerYEqualToView(_HeadPortraitImage).widthIs(kFit(38)).heightIs(kFit(13));
        
        self.start = [[FBCScoreStar alloc] initWithFrame:CGRectMake(10, 65, 70, 14)];
        _start.startColor = [UIColor orangeColor];
        _start.score = 10;
        [self.contentView addSubview:_start];
        _start.sd_layout.leftSpaceToView(_userNameLabel, kFit(10)).topEqualToView(_userNameLabel).heightIs(kFit(13)).widthIs(70);
        
        self.CommentContentLabel = [UILabel new];
        _CommentContentLabel.textColor = MColor(51, 51, 51);
        _CommentContentLabel.font = MFont(kFit(14));
        [self.contentView addSubview:_CommentContentLabel];
        _CommentContentLabel.sd_layout.leftEqualToView(_HeadPortraitImage).topSpaceToView(_HeadPortraitImage, kFit(15)).rightSpaceToView(self.contentView, kFit(10)).autoHeightRatio(0);
        
        self.studyProgressLabel = [UILabel new];
        _studyProgressLabel.font = MFont(kFit(14));
        _studyProgressLabel.text = @"学习进度.99%";
        _studyProgressLabel.textColor = MColor(152, 152, 152);
        [self.contentView addSubview:_studyProgressLabel];
        _studyProgressLabel.sd_layout.leftEqualToView(_CommentContentLabel).topSpaceToView(_CommentContentLabel, kFit(15)).widthIs(kFit(120)).heightIs(kFit(12));
        
        self.timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = MColor(152, 152, 152);
        _timeLabel.text = @"2017-7-14";
        _timeLabel.font = MFont(kFit(14));
        [self.contentView addSubview:_timeLabel];
        _timeLabel.sd_layout.rightSpaceToView(self.contentView, kFit(10)).heightIs(13).widthIs(kFit(100)).topEqualToView(_studyProgressLabel);
        [self setupAutoHeightWithBottomView:_studyProgressLabel bottomMargin:10];
        
    }
    return self;
}

-(void)setText:(NSString *)text {
    _text = text;
    self.CommentContentLabel.text = text;
    
}

@end
