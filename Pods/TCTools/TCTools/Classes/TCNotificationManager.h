//
//  TCNotificationManager.h
//  TCTools
//
//  Created by 陈 胜 on 16/3/21.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef TCNotificationManager_h
#define TCNotificationManager_h

#define kLoginStatusChangedNotification @"LoginStatusChangedNotification"   // 登录状态变化通知
#define kLanguageChangedNotification @"LanguageChangedNotification"         // 语言变化通知

#endif

@interface TCNotificationManager : NSObject

+ (void)postNotification:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;
+ (void)postNotification:(NSString *)name object:(id)object;
+ (void)postNotification:(NSString *)name;

/**
 *  登录成功广播
 *  @param userInfo 参数
 */
+ (void)postLoginNotification:(NSDictionary *)userInfo;

/**
 *  登录成功广播
 */
+ (void)postLoginNotification;

/**
 *  登出广播
 *
 *  @param userInfo 参数
 */
+ (void)postLogoutNotification:(NSDictionary *)userInfo;

/**
 *  登出广播
 */
+ (void)postLogoutNotification;

@end
