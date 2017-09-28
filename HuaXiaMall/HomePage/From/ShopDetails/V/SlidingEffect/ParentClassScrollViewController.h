//
//  ParentClassScrollViewController.h
//  Kitchen
//
//  Created by su on 16/7/8.
//  Copyright © 2016年 susu. All rights reserved.
//

#import "BaseViewController.h"

@interface ParentClassScrollViewController : BaseViewController
@property(strong, nonatomic)UIScrollView *scrollView;
@property (nonatomic, assign) BOOL canScroll;

@end
