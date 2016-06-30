//
//  TCLocalizableManager.h
//  TCTools
//
//  Created by 陈 胜 on 16/3/21.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef TCLocalizableManager_h
#define L(key, def) [TCLocalizableManager localizable:key defaultValue:def]
#endif

@interface TCLocalizableManager : NSObject

/**
 *  初始化语言包
 */
+ (void)initLanguage;

/**
 *  本地化
 *
 *  @param key          本地化key
 *  @param defaultValue 默认值
 *
 *  @return 本地化值
 */
+ (NSString *)localizable:(NSString *)key
             defaultValue:(NSString *)defaultValue;

/**
 *  本地化
 *
 *  @param key 本地化key
 *
 *  @return 本地化值
 */
+ (NSString *)localizable:(NSString *)key;

/**
 *  修改语言
 *
 *  @param language 语言，例如：zh-Hans、en
 */
+ (void)changeLanguage:(NSString *)language;

@end
