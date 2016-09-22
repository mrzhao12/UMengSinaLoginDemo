//
//  AQCLoginViewController.m
//  9.20第三方登陆-demo
//
//  Created by  apple｀ on 16/9/20.
//  Copyright © 2016年  apple｀. All rights reserved.
//

#import "AQCLoginViewController.h"
#import "AQCTabBarController.h"
#import "UMSocialSnsPlatformManager.h"
#import "UMSocialAccountManager.h"


static NSString *kuserNameKey = @"kuserNameKey";
static NSString *kpassWordKey = @"kpassWordKey";
@interface AQCLoginViewController ()

@end

@implementation AQCLoginViewController
- (IBAction)login:(UIButton *)sender {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
    
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
//            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            
    
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
            
            // 保存用户名和密码,用于第二天创建房间显示为登陆时调用 NSUserDefaults
            [[NSUserDefaults standardUserDefaults] setObject:snsAccount.userName forKey:kuserNameKey];
            
            [[NSUserDefaults standardUserDefaults] setObject:snsAccount.usid forKey:kpassWordKey];
            
            //立即保存
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            self.view.window.rootViewController = [[AQCTabBarController alloc] init];
            

            
            
            
            
        } else{
        
        
            NSLog(@"登陆失败");
        }
    
    
    });
  
    
    
    
}



@end
