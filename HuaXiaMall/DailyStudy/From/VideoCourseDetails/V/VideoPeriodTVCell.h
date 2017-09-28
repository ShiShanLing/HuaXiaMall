//
//  VideoPeriodTVCell.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/24.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *显示视频课时 未打开状态
 */
@interface VideoPeriodTVCell : UITableViewCell

- (void)changeEditedState:(NSIndexPath *)indexPath editorState:(NSString *)state;

@end
