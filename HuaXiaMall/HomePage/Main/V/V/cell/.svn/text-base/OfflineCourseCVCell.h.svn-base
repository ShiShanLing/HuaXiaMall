//
//  OfflineCourseCVCell.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/15.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OfflineCourseCVCellDelegate <NSObject>

- (void)videoCourseClickEvent:(NSInteger)index;

@end
/**
 *总裁精英课程模块
 */
@interface OfflineCourseCVCell : UICollectionViewCell

@property (strong, nonatomic) CourseView *CourseViewOne;
@property (strong, nonatomic) CourseView *CourseViewTwo;
@property (strong, nonatomic) CourseView *CourseViewThree;
@property (strong, nonatomic) CourseView *CourseViewFour;
@property (strong, nonatomic) CourseView *CourseViewFive;

@property (nonatomic, weak)id<OfflineCourseCVCellDelegate>delegate;

@end
