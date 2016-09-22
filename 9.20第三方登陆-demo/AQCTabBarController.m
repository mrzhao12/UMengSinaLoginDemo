//
//  AQCTabBarController.m
//  第三方登陆demo-umeng
//
//  Created by  apple｀ on 16/9/20.
//  Copyright © 2016年  apple｀. All rights reserved.
//

#import "AQCTabBarController.h"
#import "AQCRootViewController.h"
#import "AQCFirstViewController.h"
#import "AQCSecondViewController.h"

@interface AQCTabBarController ()

@end

@implementation AQCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildController];
    


}

- (void)setupChildController{

    AQCRootViewController *rootVC = [[AQCRootViewController alloc] init];
//    rootVC setupChildViewController
    [self setupChildViewController:rootVC title:@"首页" image:@"tab_1_gray" selectedImage:@"tab_1"];
    
    AQCFirstViewController *firstVC = [[AQCFirstViewController alloc] init];
    [self setupChildViewController:firstVC title:@"购物" image:@"tab_2_gray" selectedImage:@"tab_2"];
    
    AQCSecondViewController *secondVC = [[AQCSecondViewController alloc] init];
    [self setupChildViewController:secondVC title:@"我的" image:@"tab_3_gray" selectedImage:@"tab_3"];
    
    
    
}
- (void)setupChildViewController:(UIViewController *) childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *) selectedImage{
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selected = [UIImage imageNamed:selectedImage];
    childVC.tabBarItem.selectedImage = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    修改系统文字颜色
    NSMutableDictionary *textAttrs =  [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];

// 包装一个控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}
//- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *) image selectedImage:(NSString *) selectedImage{
//   
//    childVC.title = title;
//    childVC.tabBarItem.image = [UIImage imageNamed:image];
//    
//    UIImage *selected = [UIImage imageNamed:selectedImage];
//    childVC.tabBarItem.selectedImage = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    // 修改系统 文字的颜色
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
//    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
//      selectTextAttrs [NSForegroundColorAttributeName] = [UIColor whiteColor];
////    selectTextAttrs[NSForegroundColorAttributeName] = RGBA(90,206, 253, 1);
//    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    [childVC.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
//    
//    // 包装一个控制器
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
//    
////    //    设置导航栏titleView的字体大小和颜色
////    UIColor *titleColor = RGBA(82, 113, 222, 1);
////    [nav.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:titleColor}];
////    
//    
//    
//    [self addChildViewController:nav];
//    
//}
//
@end
