//
//  StudentsCommentTVCell.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/13.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *评论CELL 线上学习
 */
@interface StudentsCommentTVCell : UITableViewCell
/**
 *评论列表
 */
@property (nonatomic, strong) UILabel *CommentContentLabel;

/**
 *
 */
@property (nonatomic, copy)NSString *text;

@end
