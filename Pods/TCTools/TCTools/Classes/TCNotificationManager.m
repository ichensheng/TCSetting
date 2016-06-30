//
//  TCNotificationManager.m
//  TCTools
//
//  Created by 陈 胜 on 16/3/21.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "TCNotificationManager.h"

@implementation TCNotificationManager

+ (void)postNotification:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}

+ (void)postNotification:(NSString *)name object:(id)object {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
}

+ (void)postNotification:(NSString *)name {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
}

/**
 *  登录成功广播
 *  @param userInfo 参数
 */
+ (void)postLoginNotification:(NSDictionary *)userInfo {
    [self postNotification:kLoginStatusChangedNotification
                    object:@YES
                  userInfo:userInfo];
}

/**
 *  登录成功广播
 */
+ (void)postLoginNotification {
    [self postLoginNotification:nil];
}

/**
 *  登出广播
 *
 *  @param userInfo 参数
 */
+ (void)postLogoutNotification:(NSDictionary *)userInfo {
    [self postNotification:kLoginStatusChangedNotification
                    object:@NO
                  userInfo:userInfo];
}

/**
 *  登出广播
 */
+ (void)postLogoutNotification {
    [self postLogoutNotification:nil];
}

@end
