//
//  APAppDelegate.m
//  AliSDKDemo
//
//  Created by 方彬 on 11/29/13.
//  Copyright (c) 2013 Alipay.com. All rights reserved.
//

#import "APAppDelegate.h"
#import <AlipaySDK/AlipaySDK.h>
#import "AlixPayResult.h"

@implementation APAppDelegate{

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
              openURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation {

  //跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给SDK
  if ([url.host isEqualToString:@"safepay"]) {
    [[AlipaySDK defaultService]
        processOrderWithPaymentResult:url
                      standbyCallback:^(NSDictionary *resultDic) {
                          NSLog(@"result = %@", resultDic);
                          //结果处理
                          AlixPayResult* result = [AlixPayResult itemWithDictory:resultDic];
                          
                          if (result)
                          {
//                              状态返回9000为成功
                              if (result.statusCode == 9000)
                              {
                                  /*
                                   *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
                                   */
                                  NSLog(@"支付宝交易成功");
                                  
                              }
                              else
                              {
                                  //交易失败
                                  NSLog(@"支付失败");

                              }
                          }
                          else
                          {
                              //失败
                              NSLog(@"支付失败");
                          }

                      }];
  }

  return YES;
}

@end
