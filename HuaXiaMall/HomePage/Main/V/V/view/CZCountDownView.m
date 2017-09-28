//
//  CZCountDownView.m
//  countDownDemo
//
//  Created by 石山岭 on 2017/5/9.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "CZCountDownView.h"
// label数量
#define labelCount 3
#define separateLabelCount 2

#define MColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0f]
@interface CZCountDownView (){
    // 定时器
    NSTimer *timer;
}
@property (nonatomic,strong)NSMutableArray *timeLabelArrM;
@property (nonatomic,strong)NSMutableArray *separateLabelArrM;
// day
@property (nonatomic,strong)UILabel *dayLabel;
// hour
@property (nonatomic,strong)UILabel *hourLabel;
// minues
@property (nonatomic,strong)UILabel *minuesLabel;
// seconds
@property (nonatomic,strong)UILabel *secondsLabel;
@end

@implementation CZCountDownView
// 创建单例
+ (instancetype)shareCountDown{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CZCountDownView alloc] init];
    });
    return instance;
}

+ (instancetype)countDown{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.hourLabel];
        [self addSubview:self.minuesLabel];
        [self addSubview:self.secondsLabel];
        
        for (NSInteger index = 0; index < separateLabelCount; index ++) {
            UILabel *separateLabel = [[UILabel alloc] init];
            separateLabel.text = @":";
            separateLabel.textColor = MColor(255, 11, 21);
            separateLabel.font = [UIFont systemFontOfSize:8];
            separateLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:separateLabel];
            [self.separateLabelArrM addObject:separateLabel];
        }
    }
    return self;
}

- (void)setBackgroundImageName:(NSString *)backgroundImageName{
    _backgroundImageName = backgroundImageName;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImageName]];
    imageView.frame = self.bounds;
    [self addSubview:imageView];
//    [self bringSubviewToFront:imageView];
}

// 拿到外界传来的时间戳
- (void)setTimestamp:(NSInteger)timestamp{
    _timestamp = timestamp;
    if (_timestamp != 0) {
        timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }
}

-(void)timer:(NSTimer*)timerr{
    _timestamp--;
    [self getDetailTimeWithTimestamp:_timestamp];
    if (_timestamp == 0) {
        [timer invalidate];
        timer = nil;
        // 执行block回调
        self.timerStopBlock();
    }
}

- (void)getDetailTimeWithTimestamp:(NSInteger)timestamp{
    NSInteger ms = timestamp;
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 99;
    
    // 剩余的
    NSInteger day = ms / dd;// 天
    NSInteger hour = (ms - day * dd) / hh;// 时
    NSInteger minute = (ms - day * dd - hour * hh) / mi;// 分
    NSInteger second = (ms - day * dd - hour * hh - minute * mi) / ss;// 秒

    if (hour < 10) {
       self.hourLabel.text = [NSString stringWithFormat:@"0%zd",hour];
    }else {
        self.hourLabel.text = [NSString stringWithFormat:@"%zd",hour];
    }
    if (minute < 10) {
        self.minuesLabel.text = [NSString stringWithFormat:@"0%zd",minute];
    }else {
        self.minuesLabel.text = [NSString stringWithFormat:@"%zd",minute];
    }
    if (second < 10) {
       self.secondsLabel.text = [NSString stringWithFormat:@"0%zd",second];
    }else {
       self.secondsLabel.text = [NSString stringWithFormat:@"%zd",second];
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    // 获得view的宽、高
    CGFloat viewW = self.frame.size.width;
    CGFloat viewH = self.frame.size.height;
    // 单个label的宽高
    CGFloat labelW = viewW / labelCount;
    CGFloat labelH = viewH;
    self.hourLabel.frame = CGRectMake(0, 0, labelH, labelH);
    self.minuesLabel.frame = CGRectMake(1 * labelW , 0, labelH, labelH);
    self.secondsLabel.frame = CGRectMake(2 * labelW, 0, labelH, labelH);
    
    for (NSInteger index = 0; index < self.separateLabelArrM.count ; index ++) {
        UILabel *separateLabel = self.separateLabelArrM[index];
        
        separateLabel.frame = CGRectMake(labelW * (index + 1) - 5 , 0, 5, labelH);
        
        
    }
}


#pragma mark - setter & getter

- (NSMutableArray *)timeLabelArrM{
    if (_timeLabelArrM == nil) {
        _timeLabelArrM = [[NSMutableArray alloc] init];
    }
    return _timeLabelArrM;
}

- (NSMutableArray *)separateLabelArrM{
    if (_separateLabelArrM == nil) {
        _separateLabelArrM = [[NSMutableArray alloc] init];
    }
    return _separateLabelArrM;
}


- (UILabel *)hourLabel{
    if (_hourLabel == nil) {
        _hourLabel = [[UILabel alloc] init];
        _hourLabel.textAlignment = NSTextAlignmentCenter;
        _hourLabel.font = [UIFont systemFontOfSize:11];
        _hourLabel.textColor = [UIColor whiteColor];
        _hourLabel.layer.cornerRadius = 2;
        _hourLabel.layer.masksToBounds = YES;
        _hourLabel.text = @"00";
        _hourLabel.backgroundColor = MColor(255, 11, 21);
    }
    return _hourLabel;
}

- (UILabel *)minuesLabel{
    if (_minuesLabel == nil) {
        _minuesLabel = [[UILabel alloc] init];
        _minuesLabel.textAlignment = NSTextAlignmentCenter;
        _minuesLabel.font = [UIFont systemFontOfSize:11];
        _minuesLabel.textColor = [UIColor whiteColor];
        _minuesLabel.layer.cornerRadius = 2;
        _minuesLabel.layer.masksToBounds = YES;
        _minuesLabel.text = @"00";
        _minuesLabel.backgroundColor = MColor(255, 11, 21);
    }
    return _minuesLabel;
}

- (UILabel *)secondsLabel{
    if (_secondsLabel == nil) {
        _secondsLabel = [[UILabel alloc] init];
        _secondsLabel.textAlignment = NSTextAlignmentCenter;
        _secondsLabel.font = [UIFont systemFontOfSize:11];
        _secondsLabel.textColor = [UIColor whiteColor];
        _secondsLabel.layer.cornerRadius = 2;
        _secondsLabel.layer.masksToBounds = YES;
        _secondsLabel.backgroundColor = MColor(255, 11, 21);
        _secondsLabel.text = @"00";
    }
    return _secondsLabel;
}


@end
