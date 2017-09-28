//
//  MyCollectionViewCell.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/1/12.
//  Copyright © 2017年 石山岭. All rights reserved.
//


#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.imageV = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:self.imageV];
        
        self.seletView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-20, 5, 15, 15)];
        self.seletView.image = [UIImage imageNamed:@"list_no_tick_round"];
        [self addSubview:self.seletView];
        
        
    }
    return self;
}


//- (void)setSelected:(BOOL)selected  {
//    [super setSelected:selected];
//    // Configure the view for the selected state
//    
//    if (selected) {
//        [self.seletView setImage:[UIImage imageNamed:@"list_tick_round"]];
//    } else {
//        [self.seletView setImage:[UIImage imageNamed:@"list_no_tick_round"]];
//    }
//    
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
