//
//  BaseViewController.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/22.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "BaseViewController.h"
#import "ThereNoInternetView.h"
@interface BaseViewController ()<ThereNoInternetViewDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching>

@end

@implementation BaseViewController
- (NSManagedObjectContext *)managedContext {
    if (!_managedContext) {
        //获取Appdelegate对象
        id delegate = [[UIApplication sharedApplication] delegate];
        _managedContext = [delegate managedObjectContext];
    }
    return _managedContext;
}

- (AppDelegate *)delegate {
    if (!_delegate) {
        _delegate = [[AppDelegate alloc] init];
    }
    return _delegate;
}

-(void)viewWillAppear:(BOOL)animated {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"ThereNoInternetView" owner:nil options:nil];
    self.noInternetView = [nibContents lastObject];
    _noInternetView.delegate = self;
    _noInternetView.frame = CGRectMake(0, 64, kScreen_widht, kScreen_heigth -64);
    [self.view addSubview:_noInternetView];
}

- (void)dataRefreshClick {


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
