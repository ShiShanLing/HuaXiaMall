//
//  GroupBuyCVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/23.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "GroupBuyVideoCVCell.h"
#define kView1_2_width  (kScreen_widht- kFit(30))/2
#define kView3_4_5_width  (kScreen_widht- kFit(30))/3
@implementation GroupBuyVideoCVCell
-(instancetype)initWithFrame:(CGRect)frame {
    self =[ super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *contentViewOne = [UIView new];
        [self.contentView addSubview:contentViewOne];
        [contentViewOne AddUnderscore:nil];
        contentViewOne.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(kFit(146));
        {
            UIView *view = [UIView new];
            view = contentViewOne;
            self.CourseViewOne = [CourseView new];
            [_CourseViewOne DetermineControlSizeFont:kFit(10.0) viewWidht:kView1_2_width];
            [view addSubview:_CourseViewOne];
            _CourseViewOne.sd_layout.leftSpaceToView(view, kFit(10)).topSpaceToView(view, kFit(10)).widthIs(kView1_2_width).heightIs(kFit(128));
            
            self.CourseViewTwo = [CourseView new];
            [_CourseViewTwo DetermineControlSizeFont:kFit(10.0) viewWidht:kView1_2_width];
            [view addSubview:_CourseViewTwo];
            _CourseViewTwo.sd_layout.leftSpaceToView(_CourseViewOne, kFit(10)).topSpaceToView(view, kFit(10)).widthIs(kView1_2_width).heightIs(kFit(128));
        }
        UIView *contentViewTwo = [UIView new];
        [self.contentView addSubview:contentViewTwo];
        contentViewTwo.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(contentViewOne, 0).rightSpaceToView(self.contentView, 0).heightIs(kFit(124));
        {
            UIView *view = [UIView new];
            view = contentViewTwo;
            self.CourseViewThree = [CourseView new];
            [_CourseViewThree DetermineControlSizeFont:kFit(10.0) viewWidht:kView3_4_5_width];
            [view addSubview:_CourseViewThree];
            _CourseViewThree.sd_layout.leftSpaceToView(view, kFit(10)).topSpaceToView(view, kFit(10)).widthIs(kView3_4_5_width).heightIs(kFit(93));
            
            self.CourseViewFour = [CourseView new];
            [_CourseViewFour DetermineControlSizeFont:kFit(10.0) viewWidht:kView3_4_5_width];
            [view addSubview:_CourseViewFour];
            _CourseViewFour.sd_layout.leftSpaceToView(_CourseViewThree, kFit(5)).topSpaceToView(view, kFit(10)).widthIs(kView3_4_5_width).heightIs(kFit(93));
            
            self.CourseViewFive = [CourseView new];
            [_CourseViewFive DetermineControlSizeFont:kFit(10.0) viewWidht:kView3_4_5_width];
            [view addSubview:_CourseViewFive];
            _CourseViewFive.sd_layout.leftSpaceToView(_CourseViewFour, kFit(5)).topSpaceToView(view, kFit(10)).widthIs(kView3_4_5_width).heightIs(kFit(93));
        }
        
        
        
    }
    return self;
}

@end
