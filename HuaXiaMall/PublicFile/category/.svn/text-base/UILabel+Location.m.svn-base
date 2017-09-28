//
//  UILabel+Location.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/1.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "UILabel+Location.h"

@implementation UILabel (Location)
- (void) textLeftTopAlign:(CGFloat)heigth width:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12.f], NSParagraphStyleAttributeName:paragraphStyle.copy};

    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(width, heigth) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    CGRect frame = self.frame;
    frame.size.height = labelSize.height;
   
    self.frame = frame;
}
@end
