//
//  NotLoggedInView.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/21.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NotLoggedInViewdelegate <NSObject>

- (void)shoppingCartlogin;

@end

@interface NotLoggedInView : UIView


/**
 *
 */
@property (nonatomic, weak)id<NotLoggedInViewdelegate>delegate;
@end
