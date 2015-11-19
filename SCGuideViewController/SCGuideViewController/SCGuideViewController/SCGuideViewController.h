//
//  SCGuideViewController.h
//  SCGuideViewController
//
//  Created by dllo on 15/11/18.
//  Copyright © 2015年 SC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCGuideViewControllerDelegate <NSObject>
- (void)SCGuideViewControllerJump;
@end

@interface SCGuideViewController : UIViewController<SCGuideViewControllerDelegate>
//两个接口
@property(nonatomic, strong)NSArray *array;//****引导页模态到UITabBarController的接口
//声明协议
@property(nonatomic, strong)id<SCGuideViewControllerDelegate>delegate;
@end
