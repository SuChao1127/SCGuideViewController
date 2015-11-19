//
//  SCGuideViewController.m
//  SCGuideViewController
//
//  Created by dllo on 15/11/18.
//  Copyright © 2015年 SC. All rights reserved.
//

#import "SCGuideViewController.h"
#import "FitHeader.h"

@interface SCGuideViewController ()<UIScrollViewDelegate>
@property(nonatomic, retain)UIScrollView *scrollView;
@end

@implementation SCGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //接口数组
    self.array = @[@"yindao1", @"yindao2", @"yindao3", @"yindao4"];
    
    //初始化ScrollView
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * _array.count, self.view.frame.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentOffset = CGPointMake(0, 0);
    //添加图片
    for (NSInteger i = 0; i < _array.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        imageView.image = [UIImage imageNamed:_array[i]];
        [_scrollView addSubview:imageView];
    }
    [self.view addSubview:_scrollView];
    //初始化跳到主页的Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor darkGrayColor];
    button.frame = CGRectMake(300 * FitWidth, 30 * FitHeight, 40 * FitWidth, 40 * FitWidth);
    button.layer.cornerRadius = 20 * FitWidth;
    [button addTarget:self action:@selector(ignoreAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"跳过" forState:UIControlStateNormal];
    [self.view addSubview:button];
}
#pragma mark Button的点击方法跳到主页
- (void)ignoreAction
{
    //跳转代理方法
    [self.delegate SCGuideViewControllerJump];
}
#pragma mark 右划跳到主页的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_scrollView.contentOffset.x
        > (_array.count - 1)  * self.view.frame.size.width + 50) {
        [self.delegate SCGuideViewControllerJump];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
