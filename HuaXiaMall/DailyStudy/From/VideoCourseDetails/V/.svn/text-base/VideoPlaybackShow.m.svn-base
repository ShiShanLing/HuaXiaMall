//
//  VideoPlaybackShow.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/24.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "VideoPlaybackShow.h"
#import "XLCircleProgress.h"
@interface VideoPlaybackShow ()

@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;

@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;

@property (weak, nonatomic) IBOutlet UIView *progressView;

@end

@implementation VideoPlaybackShow  {
    XLCircleProgress *_circle;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        
    }
    return self;
}

-(void)layoutSubviews {
    
    self.progressView.backgroundColor = [UIColor whiteColor];
    _circle = [[XLCircleProgress alloc] initWithFrame:CGRectMake(0, 0, kFit(40), kFit(40))];
    _circle.progress = 0.5;
    [self.progressView addSubview:_circle];
    _circle.sd_layout.centerYEqualToView(_progressView).centerXEqualToView(_progressView).widthIs(kFit(40)).heightIs(kFit(40));
}





@end
