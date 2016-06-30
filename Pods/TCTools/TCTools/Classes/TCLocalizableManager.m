//
//  TCLocalizableManager.m
//  TCTools
//
//  Created by 陈 胜 on 16/3/21.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "TCLocalizableManager.h"
#import "TCNotificationManager.h"

static NSBundle * bundle = nil;
static NSString * const TCLanguageKey = @"__LANGUAGE__";
static NSString * const TCLanguageFileName = @"Localizable";

@implementation TCLocalizableManager

/**
 *  初始化语言包
 */
+ (void)initLanguage {
    NSString *language = [self currentLanguage];
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}

/**
 *  本地化
 *
 *  @param key          本地化key
 *  @param defaultValue 默认值
 *
 *  @return 本地化值
 */
+ (NSString *)localizable:(NSString *)key
             defaultValue:(NSString *)defaultValue {

    return [bundle localizedStringForKey:key
                                   value:defaultValue
                                   table:TCLanguageFileName];
}

/**
 *  本地化
 *
 *  @param key 本地化key
 *
 *  @return 本地化值
 */
+ (NSString *)localizable:(NSString *)key {
    return [self localizable:key defaultValue:nil];
}

/**
 *  修改语言
 *
 *  @param language 语言，例如：zh-Hans、en
 */
+ (void)changeLanguage:(NSString *)language {
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:language forKey:TCLanguageKey];
    [userDefault synchronize];
    
    // 发出语言修改通知
    [TCNotificationManager postNotification:kLanguageChangedNotification];
}

#pragma mark - Private Methods 

+ (NSString *)currentLanguage {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *language = [userDefault objectForKey:TCLanguageKey];
    if (!language || [language isEqualToString:@""]) {
        language = @"zh-Hans";
    }
    return language;
}

@end
