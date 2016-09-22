//
//  AppDelegate+AQCUmeng.m
//  9.20第三方登陆-demo
//
//  Created by  apple｀ on 16/9/20.
//  Copyright © 2016年  apple｀. All rights reserved.
//

#import "AppDelegate+AQCUmeng.h"
#import "UMSocialData.h"
#import "UMSocialSinaSSOHandler.h"

@implementation AppDelegate (AQCUmeng)

- (void)setupUmeng{

        //设置umengkey
        [UMSocialData setAppKey:@"57e0ba3be0f55a43f500199d"];
        //RedirectURL 授权回调页
        [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"1988765757"
                                                  secret:@"69a0a1f48501de86d1038f9a0476f3fd"
                                             RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];


}
//    //设置umengkey
//    [UMSocialData setAppKey:@"57a5581267e58e2557001639"];
//    //RedirectURL 授权回调页
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2892166685"
//                                              secret:@"7849eb7a9922c4318b1a0cff9a215ff3"
//                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];

@end
