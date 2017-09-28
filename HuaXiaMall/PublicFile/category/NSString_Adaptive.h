//
//  NSString_Adaptive.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/10.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *计算字体需要的长度 用来计算label 等控件的自适应长度  以及给文字添加删除线
 */
@interface NSString (Adaptive)
/**
 *根据一段文字 和 文字大小 计算一段文字的宽度
 */
- (CGFloat)getWidthWithTitleFont:(UIFont *)font;
/**
 *根据一个给定宽度的控件 和 一段文字 以及文字大小 计算出需要的高度
 */
- (CGFloat)getHeightByWidth:(CGFloat)width font:(UIFont *)font;
/**
 *文字添加删除线
 */
- (NSAttributedString  *)stringAddRemoveLine;

- (NSString *)translationArabicNum:(NSInteger)arabicNum;

/**
 *  计算当前字符串显示所需的实际frame，返回值的x = 0, y = 0
 */
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes;
/**
 *判断手机号格式是否正确
 */
- (BOOL)isMobileNumber;
/**
 *获取当前时间
 */
-(NSString*)getCurrentTimes;
/**
 *获取当前时间段的时间戳(秒)
 */
-(NSString *)getNowTimeTimestamp;
@end
