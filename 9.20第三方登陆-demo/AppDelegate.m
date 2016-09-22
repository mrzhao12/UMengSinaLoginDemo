

//
//  AppDelegate.m
//  9.20第三方登陆-demo
//
//  Created by  apple｀ on 16/9/20.
//  Copyright © 2016年  apple｀. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+AQCUmeng.h"
#import "AQCTabBarController.h"
#import "AQCLoginViewController.h"
#import "UMSocialSnsService.h"
static NSString *kuserNameKey = @"kuserNameKey";
static NSString *kpassWordKey = @"kpassWordKey";
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [self setupUmeng];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:kpassWordKey] length] && [[defaults objectForKey:kuserNameKey] length]) {
        self.window.rootViewController = [[AQCTabBarController alloc] init];

        
        
    }else{
    
        self.window.rootViewController = [[AQCLoginViewController alloc] init];
        
    
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}


@end
