//
//  AppDelegate.m
//  SCGuideViewController
//
//  Created by dllo on 15/11/18.
//  Copyright © 2015年 SC. All rights reserved.
//

#import "AppDelegate.h"
#import "SCGuideViewController.h"
#import "ViewController.h"
@interface AppDelegate ()<SCGuideViewControllerDelegate, UITabBarControllerDelegate>
@property(nonatomic, strong)SCGuideViewController *guideViewController;
@property(nonatomic, strong)UITabBarController *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    //初始化 VC
    ViewController *vc = [[ViewController alloc] init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"wo"] tag:1004];
    //初始化导航控制器
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc];
    //初始化UITabBarController
    self.tabBarController = [[UITabBarController alloc] init];
    _tabBarController.viewControllers = @[nav1];
    _tabBarController.delegate = self;
    //检查App是否首次运行(直走一次)
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]) {
        //初始化导航控制器
        self.guideViewController = [[SCGuideViewController alloc] init];
        _guideViewController.delegate = self;
        //****引导页图片接口的数组
        
        //****引导页模态到UITabBarController的接口
        // _guideViewController.tabBarContraller = _tabBarController;
        //设置轻量级缓存为一
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        //添加到Window上
        _window.rootViewController = _guideViewController;
    }
    //否侧,不是初次运行
    else{
        //将tabBar设置为Window的根视图控制器
        _window.rootViewController = _tabBarController;
    }
    return YES;
}
- (void)SCGuideViewControllerJump
{
    _tabBarController.modalTransitionStyle = 1;
    [_guideViewController presentViewController:_tabBarController animated:YES completion:nil];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
