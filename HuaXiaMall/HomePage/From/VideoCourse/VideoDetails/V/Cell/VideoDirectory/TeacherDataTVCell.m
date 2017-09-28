//
//  TeacherDataTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/1.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "TeacherDataTVCell.h"

@interface TeacherDataTVCell ()
/**
 *外框view
 */
@property (weak, nonatomic) IBOutlet UIView *boxView;
/**
 *老师头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *teacherImage;
/**
 *老师名字
 */
@property (weak, nonatomic) IBOutlet UILabel *teacherNameLabel;
/**
 *老师课程数量
 */
@property (weak, nonatomic) IBOutlet UILabel *courseNumLabel;
/**
 *老师学生数量
 */
@property (weak, nonatomic) IBOutlet UILabel *studentsNumLabel;
/**
 *好评度
 */
@property (weak, nonatomic) IBOutlet UILabel *REVIEWLabel;
/**
 *老师介绍
 */
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;

@end

@implementation TeacherDataTVCell

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
         [self.introduceLabel textLeftTopAlign:kFit(50) width:kFit(302)];
    }
    return self;
}

- (void)layoutSubviews {
    self.boxView.layer.borderWidth = 1;
    self.boxView.layer.borderColor = MColor(152, 152, 152).CGColor;
   
    
}

@end

