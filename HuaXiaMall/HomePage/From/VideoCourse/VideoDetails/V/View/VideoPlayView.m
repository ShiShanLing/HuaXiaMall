//
//  VideoPlayView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/27.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "VideoPlayView.h"

@interface VideoPlayView ()

@property (nonatomic, strong)UIImageView *videoImageView;
@property (nonatomic, strong)UIButton *PlayButton;
@end

@implementation VideoPlayView

-(instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        self.videoImageView = [[UIImageView alloc] init];
        _videoImageView.image = [UIImage imageNamed:@"psmg.png"];
        [self addSubview:_videoImageView];
        _videoImageView.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, 0);
        
        self.PlayButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_PlayButton setImage:[UIImage imageNamed:@"bofang"] forState:(UIControlStateNormal)];
        [self addSubview:_PlayButton];
        _PlayButton.sd_layout.widthIs(kFit(70)).heightIs(kFit(70)).centerXEqualToView(self).centerYEqualToView(self);
        
    }
    return self;
}

@end
