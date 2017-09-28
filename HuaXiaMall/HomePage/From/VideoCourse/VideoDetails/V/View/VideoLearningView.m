//
//  VideoLearningView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/1.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "VideoLearningView.h"


@interface VideoLearningView ()


@end

@implementation VideoLearningView
- (IBAction)handleconsulting:(UIButton *)sender {
}
- (IBAction)handleApply:(UIButton *)sender {
    
}
+(instancetype)videoLearningView{
    return [[[NSBundle mainBundle] loadNibNamed:@"VideoLearningView"
                                          owner:nil options:nil]lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
