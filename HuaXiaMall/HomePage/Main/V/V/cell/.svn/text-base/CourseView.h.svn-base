//
//  CourseView.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/16.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CourseView;
@protocol CourseViewDelegate <NSObject>

- (void)viewClickEvent:(CourseView *)view;

@end

@interface CourseView : UIView
/**
 * 商品图片
 */
@property (strong, nonatomic)UIImageView *showImage;
/**
 * 商品名字
 */
@property (strong, nonatomic)UILabel *goodsName;
/**
 * 商品价钱
 */
@property (strong, nonatomic)UILabel *goodspriceLabel;
/**
 * 被购买数量
 */
@property (strong, nonatomic)UILabel *beBuyNumLabel;

/**
 *
 */
@property (nonatomic, strong) UIButton *CouresStateBtn;

- (void)DetermineControlSizeFont:(CGFloat)size viewWidht:(CGFloat)width;

@property (nonatomic, weak)id<CourseViewDelegate>delegate;

@end
