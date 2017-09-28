//
//  OfflineCourseCVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/15.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "OfflineCourseCVCell.h"
#define kView1_2_width  (kScreen_widht- kFit(30))/2
#define kView3_4_5_width  (kScreen_widht- kFit(30))/3
@interface OfflineCourseCVCell ()<CourseViewDelegate>

@end

@implementation OfflineCourseCVCell


-(instancetype)initWithFrame:(CGRect)frame {
    self =[ super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *titleView = [UIView new];
        [self.contentView addSubview:titleView];
        [titleView AddUnderscore:nil];
        titleView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(kFit(35));
        {
            UIButton *logoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            [logoBtn setImage:[UIImage imageNamed:@"jxkc"] forState:(UIControlStateNormal)];
            [titleView addSubview:logoBtn];
            logoBtn.sd_layout.leftSpaceToView(titleView, kFit(130)).heightIs(kFit(21)).widthIs(kFit(21)).centerYEqualToView(titleView);
            
            UILabel *titleLabel = [UILabel new];
            titleLabel.text = @"总裁精英课程";
            titleLabel.textColor = MColor(51, 51, 51);
            titleLabel.font = MFont(kFit(14));
            [titleView addSubview:titleLabel];
            titleLabel.sd_layout.leftSpaceToView(logoBtn, kFit(10)).centerYEqualToView(titleView).widthIs(kFit(100)).heightIs(kFit(14));
        }
        UIView *contentViewOne = [UIView new];
        [self.contentView addSubview:contentViewOne];
        [contentViewOne AddUnderscore:nil];
        contentViewOne.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(titleView, 0).rightSpaceToView(self.contentView, 0).heightIs(kFit(146));
        {
            UIView *view = [UIView new];
            view = contentViewOne;
            self.CourseViewOne = [CourseView new];
            [_CourseViewOne DetermineControlSizeFont:kFit(10.0) viewWidht:kView1_2_width];
            _CourseViewOne.delegate = self;
            self.CourseViewOne.showImage.image = [UIImage imageNamed:@"video1"];
           // [self.CourseViewOne.showImage setImageViewGifName:@"erha6"];
            _CourseViewOne.tag = 0;
            [view addSubview:_CourseViewOne];
            
            _CourseViewOne.sd_layout.leftSpaceToView(view, kFit(10)).topSpaceToView(view, kFit(10)).widthIs(kView1_2_width).heightIs(kFit(128));
            
            self.CourseViewTwo = [CourseView new];
            [_CourseViewTwo DetermineControlSizeFont:kFit(10.0) viewWidht:kView1_2_width];
            _CourseViewTwo.delegate = self;
            _CourseViewTwo.tag = 1;
            self.CourseViewTwo.showImage.image = [UIImage imageNamed:@"video2"];
           // [self.CourseViewTwo.showImage setImageViewGifName:@"erha6"];
            [view addSubview:_CourseViewTwo];
            _CourseViewTwo.sd_layout.leftSpaceToView(_CourseViewOne, kFit(10)).topSpaceToView(view, kFit(10)).widthIs(kView1_2_width).heightIs(kFit(128));
            
        }
        UIView *contentViewTwo = [UIView new];
        [self.contentView addSubview:contentViewTwo];
        contentViewTwo.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(contentViewOne, 0).rightSpaceToView(self.contentView, 0).heightIs(kFit(146));
        {
            UIView *view = [UIView new];
            view = contentViewTwo;
            self.CourseViewThree = [CourseView new];
            [_CourseViewThree DetermineControlSizeFont:kFit(10.0) viewWidht:kView1_2_width];
            _CourseViewThree.delegate = self;
            [_CourseViewThree.CouresStateBtn setImage:[UIImage imageNamed:@"VideoCourse"] forState:(UIControlStateNormal)];
            _CourseViewThree.tag = 2;
            self.CourseViewThree.showImage.image = [UIImage imageNamed:@"video3"];
          //  [self.CourseViewThree.showImage setImageViewGifName:@"erha6"];
            [view addSubview:_CourseViewThree];
            _CourseViewThree.sd_layout.leftSpaceToView(view, kFit(10)).topSpaceToView(view, kFit(10)).widthIs(kView1_2_width).heightIs(kFit(128));
            
            self.CourseViewFour = [CourseView new];
            [_CourseViewFour DetermineControlSizeFont:kFit(10.0) viewWidht:kView1_2_width];
            _CourseViewFour.delegate = self;
            _CourseViewFour.tag = 3;
            [_CourseViewFour.CouresStateBtn setImage:[UIImage imageNamed:@"VideoCourse"] forState:(UIControlStateNormal)];
            self.CourseViewFour.showImage.image = [UIImage imageNamed:@"video6"];
            [view addSubview:_CourseViewFour];
            _CourseViewFour.sd_layout.leftSpaceToView(_CourseViewThree, kFit(5)).topSpaceToView(view, kFit(10)).widthIs(kView1_2_width).heightIs(kFit(128));
        }
    }
    return self;
}

- (void)viewClickEvent:(CourseView *)view {

    if ([_delegate respondsToSelector:@selector(videoCourseClickEvent:)]) {
        [_delegate videoCourseClickEvent:view.tag];
    }
}

@end
