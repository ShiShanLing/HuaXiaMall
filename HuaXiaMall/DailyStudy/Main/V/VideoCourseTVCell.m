//
//  VideoCourseTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/19.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "VideoCourseTVCell.h"
#import "XLCircleProgress.h"
@interface VideoCourseTVCell ()
/**
 *商品的图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
/**
 *商品的名字
 */
@property (weak, nonatomic) IBOutlet UILabel *goodsnameLabel;
/**
 *上次学习时间
 */
@property (weak, nonatomic) IBOutlet UILabel *lastTimeStudyLaebl;
/**
 *学习到哪里
 */
@property (weak, nonatomic) IBOutlet UILabel *studyWhichLabel;
/**
 *学习进度 百分比
 */
@property (weak, nonatomic) IBOutlet UIView *planView;

@end

@implementation VideoCourseTVCell {
    XLCircleProgress *_circle;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    
    
    }
    return self;
}

-(void)layoutSubviews {
    
    self.planView.backgroundColor = [UIColor whiteColor];
    _circle = [[XLCircleProgress alloc] initWithFrame:CGRectMake(0, 0, kFit(40), kFit(40))];
    _goodsImageView.image = [UIImage imageNamed:@"video1"];
    _circle.progress = 0.5;
    [self.planView addSubview:_circle];
    _circle.sd_layout.centerYEqualToView(_planView).centerXEqualToView(_planView).widthIs(kFit(40)).heightIs(kFit(40));
}


@end
