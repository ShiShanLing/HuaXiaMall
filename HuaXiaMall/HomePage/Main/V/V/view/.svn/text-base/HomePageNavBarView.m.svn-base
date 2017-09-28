//
//  HomePageNavBarView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/23.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "HomePageNavBarView.h"
#import "SearchBoxView.h"
@interface HomePageNavBarView ()<SearchBoxViewDelegate>

@property (nonatomic, strong) UIButton *QrCodeScanningBtn;
@property (nonatomic, strong) SearchBoxView *searchBoxView;

@property (nonatomic, strong) UIButton *MyNewsBtn;

@end

@implementation HomePageNavBarView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kOrange_Color;
        self.searchBoxView = [SearchBoxView new];
        _searchBoxView.Delegate = self;
        [self addSubview:_searchBoxView];
        _searchBoxView.sd_layout.centerXEqualToView(self).widthIs(kFit(270)).heightIs(28).topSpaceToView(self, 28);
        
        self.QrCodeScanningBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_QrCodeScanningBtn setImage:[UIImage imageNamed:@"sys"] forState:(UIControlStateNormal)];
        [_QrCodeScanningBtn addTarget:self action:@selector(handleScanningBtn) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_QrCodeScanningBtn];
        _QrCodeScanningBtn.sd_layout.leftSpaceToView(self, 0).centerYEqualToView(_searchBoxView).heightIs(44).widthIs(44);
        
        self.MyNewsBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_MyNewsBtn setImage:[UIImage imageNamed:@"gdxx"] forState:(UIControlStateNormal)];
        [_MyNewsBtn addTarget:self action:@selector(handleMessageBtn) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_MyNewsBtn];
        _MyNewsBtn.sd_layout.rightSpaceToView(self, 0).centerYEqualToView(_searchBoxView).heightIs(44).widthIs(44);
    }
    return self;
}
- (void)SearchJump {
    
    if ([_delegate respondsToSelector:@selector(ClickSearchBox)]) {
        [_delegate ClickSearchBox];
    }
}
- (void)handleScanningBtn {
    
    if ([_delegate respondsToSelector:@selector(QrCodeScanning)]) {
        [_delegate QrCodeScanning];
    }
}
- (void)handleMessageBtn {
    
    if ([_delegate respondsToSelector:@selector(MessageRemind)]) {
        [_delegate MessageRemind];
    }
}

@end
