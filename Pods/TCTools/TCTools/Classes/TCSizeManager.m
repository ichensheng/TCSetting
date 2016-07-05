//
//  TCSizeManager.m
//  TCTools
//
//  Created by 陈 胜 on 16/5/25.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "TCSizeManager.h"

/**
 *  存储当前UI尺寸分类key
 */
static NSString * const TCSizeCategory = @"__TCSizeCategory__";

/**
 *  UI尺寸分类，分六档
 */
NSString * const TCSizeCategorySmall = @"TCSizeCategorySmall";
NSString * const TCSizeCategoryMedium = @"TCSizeCategoryMedium";
NSString * const TCSizeCategoryLarge = @"TCSizeCategoryLarge";
NSString * const TCSizeCategoryExtraLarge = @"TCSizeCategoryExtraLarge";
NSString * const TCSizeCategoryExtraExtraLarge = @"TCSizeCategoryExtraExtraLarge";
NSString * const TCSizeCategoryExtraExtraExtraLarge = @"TCSizeCategoryExtraExtraExtraLarge";

/**
 *  字体大小常量
 */
NSString * const TCFontTextStyle10 = @"TCFontTextStyle10";
NSString * const TCFontTextStyle12 = @"TCFontTextStyle12";
NSString * const TCFontTextStyle14 = @"TCFontTextStyle14";
NSString * const TCFontTextStyle15 = @"TCFontTextStyle15";
NSString * const TCFontTextStyle16 = @"TCFontTextStyle16";
NSString * const TCFontTextStyle17 = @"TCFontTextStyle17";

/**
 *  cell高度分类
 */
NSString * const TCCellHeightStyle39 = @"TCCellHeightStyle39";
NSString * const TCCellHeightStyle44 = @"TCCellHeightStyle44";
NSString * const TCCellHeightStyle45 = @"TCCellHeightStyle45";
NSString * const TCCellHeightStyle55 = @"TCCellHeightStyle55";
NSString * const TCCellHeightStyle65 = @"TCCellHeightStyle65";
NSString * const TCCellHeightStyle82 = @"TCCellHeightStyle82";
NSString * const TCCellHeightStyle87 = @"TCCellHeightStyle87";
NSString * const TCCellHeightStyle88 = @"TCCellHeightStyle88";

/**
 *  icon尺寸分类
 */
NSString * const TCIconSizeStyle17 = @"TCIconSizeStyle17";
NSString * const TCIconSizeStyle18 = @"TCIconSizeStyle18";
NSString * const TCIconSizeStyle20 = @"TCIconSizeStyle20";
NSString * const TCIconSizeStyle23 = @"TCIconSizeStyle23";
NSString * const TCIconSizeStyle25 = @"TCIconSizeStyle25";
NSString * const TCIconSizeStyle33 = @"TCIconSizeStyle33";
NSString * const TCIconSizeStyle36 = @"TCIconSizeStyle36";
NSString * const TCIconSizeStyle40 = @"TCIconSizeStyle40";
NSString * const TCIconSizeStyle45 = @"TCIconSizeStyle45";
NSString * const TCIconSizeStyle56 = @"TCIconSizeStyle56";
NSString * const TCIconSizeStyle64 = @"TCIconSizeStyle64";
NSString * const TCIconSizeStyle65 = @"TCIconSizeStyle65";
NSString * const TCIconSizeStyle66 = @"TCIconSizeStyle66";

@implementation TCSizeManager

/**
 *  通过字体尺寸类型获取字体大小
 *
 *  @param textStyle 文本字体尺寸类型
 *  @param offset    偏移量
 *
 *  @return 字体大小
 */
+ (CGFloat)fontSizeForTextStyle:(NSString *)textStyle
                         offset:(CGFloat)offset {
    
    NSString *sizeCategory = [self sizeCategory];
    static dispatch_once_t onceToken;
    static NSDictionary *fontSizeOffsetDictionary;
    dispatch_once(&onceToken, ^{
        fontSizeOffsetDictionary = @{
                                     TCSizeCategorySmall: @{
                                             TCFontTextStyle10: @(9.375),
                                             TCFontTextStyle12: @(11.25),
                                             TCFontTextStyle14: @(13.125),
                                             TCFontTextStyle15: @(14.0625),
                                             TCFontTextStyle16: @(15),
                                             TCFontTextStyle17: @(15.9375)},
                                     
                                     TCSizeCategoryMedium: @{
                                             TCFontTextStyle10: @(10),
                                             TCFontTextStyle12: @(12),
                                             TCFontTextStyle14: @(14),
                                             TCFontTextStyle15: @(15),
                                             TCFontTextStyle16: @(16),
                                             TCFontTextStyle17: @(17)},
                                     
                                     TCSizeCategoryLarge: @{
                                             TCFontTextStyle10: @(10.625),
                                             TCFontTextStyle12: @(12.75),
                                             TCFontTextStyle14: @(14.875),
                                             TCFontTextStyle15: @(15.9375),
                                             TCFontTextStyle16: @(17),
                                             TCFontTextStyle17: @(18.0625)},
                                     
                                     TCSizeCategoryExtraLarge: @{
                                             TCFontTextStyle10: @(11.25),
                                             TCFontTextStyle12: @(13.5),
                                             TCFontTextStyle14: @(15.75),
                                             TCFontTextStyle15: @(16.875),
                                             TCFontTextStyle16: @(18),
                                             TCFontTextStyle17: @(19.125)},
                                     
                                     TCSizeCategoryExtraExtraLarge: @{
                                             TCFontTextStyle10: @(12.1875),
                                             TCFontTextStyle12: @(14.625),
                                             TCFontTextStyle14: @(17.0625),
                                             TCFontTextStyle15: @(18.28125),
                                             TCFontTextStyle16: @(19.5),
                                             TCFontTextStyle17: @(20.71875)},
                                     
                                     TCSizeCategoryExtraExtraExtraLarge: @{
                                             TCFontTextStyle10: @(12.1875),
                                             TCFontTextStyle12: @(14.625),
                                             TCFontTextStyle14: @(17.0625),
                                             TCFontTextStyle15: @(18.28125),
                                             TCFontTextStyle16: @(19.5),
                                             TCFontTextStyle17: @(20.71875)}
                                     };
        
    });
    
    CGFloat fontSize = [fontSizeOffsetDictionary[sizeCategory][textStyle] doubleValue] + offset;
    return fontSize;
}

/**
 *  通过字体尺寸类型获取字体大小
 *
 *  @param textStyle 文本字体尺寸类型
 *
 *  @return 字体大小
 */
+ (CGFloat)fontSizeForTextStyle:(NSString *)textStyle {
    return [self fontSizeForTextStyle:textStyle offset:0];
}

/**
 *  聊天页面文字字体大小
 *
 *  @return 字体大小
 */
+ (CGFloat)chatFontSize {
    NSString *sizeCategory = [self sizeCategory];
    static dispatch_once_t onceToken;
    static NSDictionary *chatFontSizeOffsetDictionary;
    dispatch_once(&onceToken, ^{
        chatFontSizeOffsetDictionary = @{
                                         TCSizeCategorySmall: @(15),
                                         TCSizeCategoryMedium: @(16),
                                         TCSizeCategoryLarge: @(17),
                                         TCSizeCategoryExtraLarge: @(18),
                                         TCSizeCategoryExtraExtraLarge: @(20),
                                         TCSizeCategoryExtraExtraExtraLarge: @(26)};
        
    });
    
    CGFloat chatFontSize = [chatFontSizeOffsetDictionary[sizeCategory] doubleValue];
    return chatFontSize;
}

/**
 *  通过cell高度类型获取不同UI尺寸的cell高度
 *
 *  @param heightStyle cell高度类型
 *
 *  @return cell高度
 */
+ (CGFloat)cellHeightWithStyle:(NSString *)heightStyle {
    NSString *sizeCategory = [self sizeCategory];
    static dispatch_once_t onceToken;
    static NSDictionary *cellHeightDictionary;
    dispatch_once(&onceToken, ^{
        cellHeightDictionary = @{
                                 TCSizeCategorySmall: @{
                                         TCCellHeightStyle39:@(37),
                                         TCCellHeightStyle44:@(41.5),
                                         TCCellHeightStyle45:@(43.5),
                                         TCCellHeightStyle55:@(52),
                                         TCCellHeightStyle65:@(61),
                                         TCCellHeightStyle82:@(77),
                                         TCCellHeightStyle87:@(82),
                                         TCCellHeightStyle88:@(82.5)},
                                 
                                 TCSizeCategoryMedium: @{
                                         TCCellHeightStyle39:@(39),
                                         TCCellHeightStyle44:@(44),
                                         TCCellHeightStyle45:@(45),
                                         TCCellHeightStyle55:@(55),
                                         TCCellHeightStyle65:@(65),
                                         TCCellHeightStyle82:@(82),
                                         TCCellHeightStyle87:@(87),
                                         TCCellHeightStyle88:@(88)},
                                 
                                 TCSizeCategoryLarge: @{
                                         TCCellHeightStyle39:@(41.5),
                                         TCCellHeightStyle44:@(47),
                                         TCCellHeightStyle45:@(47),
                                         TCCellHeightStyle55:@(58.5),
                                         TCCellHeightStyle65:@(69.5),
                                         TCCellHeightStyle82:@(87.5),
                                         TCCellHeightStyle87:@(92.5),
                                         TCCellHeightStyle88:@(93.5)},
                                 
                                 TCSizeCategoryExtraLarge: @{
                                         TCCellHeightStyle39:@(44),
                                         TCCellHeightStyle44:@(49.5),
                                         TCCellHeightStyle45:@(48.5),
                                         TCCellHeightStyle55:@(62),
                                         TCCellHeightStyle65:@(73.5),
                                         TCCellHeightStyle82:@(92.5),
                                         TCCellHeightStyle87:@(98),
                                         TCCellHeightStyle88:@(99)},
                                 
                                 TCSizeCategoryExtraExtraLarge: @{
                                         TCCellHeightStyle39:@(49),
                                         TCCellHeightStyle44:@(54),
                                         TCCellHeightStyle45:@(51.5),
                                         TCCellHeightStyle55:@(67.5),
                                         TCCellHeightStyle65:@(79.5),
                                         TCCellHeightStyle82:@(100),
                                         TCCellHeightStyle87:@(106.5),
                                         TCCellHeightStyle88:@(107.5)},
                                 
                                 TCSizeCategoryExtraExtraExtraLarge: @{
                                         TCCellHeightStyle39:@(49),
                                         TCCellHeightStyle44:@(54),
                                         TCCellHeightStyle45:@(51.5),
                                         TCCellHeightStyle55:@(67.5),
                                         TCCellHeightStyle65:@(79.5),
                                         TCCellHeightStyle82:@(100),
                                         TCCellHeightStyle87:@(106.5),
                                         TCCellHeightStyle88:@(107.5)}
                                 };
        
    });
    
    CGFloat cellHeight = [cellHeightDictionary[sizeCategory][heightStyle] doubleValue];
    return cellHeight;
}

/**
 *  通过icon高度类型获取不同UI尺寸的icon size
 *
 *  @param iconSizeStyle icon size类型
 *
 *  @return icon size
 */
+ (CGSize)iconSizeWithStyle:(NSString *)iconSizeStyle {
    NSString *sizeCategory = [self sizeCategory];
    static dispatch_once_t onceToken;
    static NSDictionary *iconSizeDictionary;
    dispatch_once(&onceToken, ^{
        iconSizeDictionary = @{
                               TCSizeCategorySmall: @{
                                       TCIconSizeStyle17:@(16),
                                       TCIconSizeStyle18:@(17),
                                       TCIconSizeStyle20:@(19),
                                       TCIconSizeStyle23:@(22),
                                       TCIconSizeStyle25:@(23),
                                       TCIconSizeStyle36:@(34),
                                       TCIconSizeStyle33:@(32),
                                       TCIconSizeStyle40:@(37.5),
                                       TCIconSizeStyle45:@(42.5),
                                       TCIconSizeStyle56:@(52.5),
                                       TCIconSizeStyle64:@(60),
                                       TCIconSizeStyle65:@(60.5),
                                       TCIconSizeStyle66:@(61.5)},
                               
                               TCSizeCategoryMedium: @{
                                       TCIconSizeStyle17:@(17),
                                       TCIconSizeStyle18:@(18),
                                       TCIconSizeStyle20:@(20),
                                       TCIconSizeStyle23:@(23),
                                       TCIconSizeStyle25:@(25),
                                       TCIconSizeStyle33:@(33),
                                       TCIconSizeStyle36:@(36),
                                       TCIconSizeStyle40:@(40),
                                       TCIconSizeStyle45:@(45),
                                       TCIconSizeStyle56:@(56),
                                       TCIconSizeStyle64:@(64),
                                       TCIconSizeStyle65:@(65),
                                       TCIconSizeStyle66:@(66)},
                               
                               TCSizeCategoryLarge: @{
                                       TCIconSizeStyle17:@(18.5),
                                       TCIconSizeStyle18:@(19.5),
                                       TCIconSizeStyle20:@(21),
                                       TCIconSizeStyle23:@(24),
                                       TCIconSizeStyle25:@(27),
                                       TCIconSizeStyle33:@(35),
                                       TCIconSizeStyle36:@(38.5),
                                       TCIconSizeStyle40:@(42.5),
                                       TCIconSizeStyle45:@(48),
                                       TCIconSizeStyle56:@(59.5),
                                       TCIconSizeStyle64:@(68),
                                       TCIconSizeStyle65:@(69.5),
                                       TCIconSizeStyle66:@(70.5)},
                               
                               TCSizeCategoryExtraLarge: @{
                                       TCIconSizeStyle17:@(19.5),
                                       TCIconSizeStyle18:@(20.5),
                                       TCIconSizeStyle20:@(22),
                                       TCIconSizeStyle23:@(26),
                                       TCIconSizeStyle25:@(28),
                                       TCIconSizeStyle33:@(37),
                                       TCIconSizeStyle36:@(40.5),
                                       TCIconSizeStyle40:@(45),
                                       TCIconSizeStyle45:@(51),
                                       TCIconSizeStyle56:@(63),
                                       TCIconSizeStyle64:@(72),
                                       TCIconSizeStyle65:@(74),
                                       TCIconSizeStyle66:@(75)},
                               
                               TCSizeCategoryExtraExtraLarge: @{
                                       TCIconSizeStyle17:@(21),
                                       TCIconSizeStyle18:@(22),
                                       TCIconSizeStyle20:@(25),
                                       TCIconSizeStyle23:@(28),
                                       TCIconSizeStyle25:@(30),
                                       TCIconSizeStyle33:@(39),
                                       TCIconSizeStyle36:@(44),
                                       TCIconSizeStyle40:@(50),
                                       TCIconSizeStyle45:@(55),
                                       TCIconSizeStyle56:@(68.5),
                                       TCIconSizeStyle64:@(78),
                                       TCIconSizeStyle65:@(81),
                                       TCIconSizeStyle66:@(82)},
                               
                               TCSizeCategoryExtraExtraExtraLarge: @{
                                       TCIconSizeStyle17:@(21),
                                       TCIconSizeStyle18:@(22),
                                       TCIconSizeStyle20:@(25),
                                       TCIconSizeStyle23:@(28),
                                       TCIconSizeStyle25:@(30),
                                       TCIconSizeStyle33:@(39),
                                       TCIconSizeStyle36:@(44),
                                       TCIconSizeStyle40:@(50),
                                       TCIconSizeStyle45:@(55),
                                       TCIconSizeStyle56:@(68.5),
                                       TCIconSizeStyle64:@(78),
                                       TCIconSizeStyle65:@(81),
                                       TCIconSizeStyle66:@(82)}
                               };
        
    });
    
    CGFloat height = [iconSizeDictionary[sizeCategory][iconSizeStyle] doubleValue];
    return CGSizeMake(height, height);
}

/**
 *  获取tabBar的高度
 *
 *  @return tabBar高度
 */
+ (CGFloat)tabBarHeight {
    NSString *sizeCategory = [self sizeCategory];
    static dispatch_once_t onceToken;
    static NSDictionary *tabBarHeightDictionary;
    dispatch_once(&onceToken, ^{
        tabBarHeightDictionary = @{
                                   TCSizeCategorySmall: @(46),
                                   TCSizeCategoryMedium: @(49),
                                   TCSizeCategoryLarge: @(52.5),
                                   TCSizeCategoryExtraLarge: @(55.5),
                                   TCSizeCategoryExtraExtraLarge: @(60),
                                   TCSizeCategoryExtraExtraExtraLarge: @(60)};
        
    });
    
    CGFloat tabBarHeight = [tabBarHeightDictionary[sizeCategory] doubleValue];
    return tabBarHeight;
}

/**
 *  获取当前UI尺寸类型
 *
 *  @return UI尺寸类型
 */
+ (NSString *)sizeCategory {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *sizeCategory = [userDefault objectForKey:TCSizeCategory];
    if (!sizeCategory || [sizeCategory isEqualToString:@""]) {
        sizeCategory = TCSizeCategoryMedium;
    }
    return sizeCategory;
}

/**
 *  修改UI尺寸
 *
 *  @param sizeCategory UI尺寸
 */
+ (void)changeSizeCategory:(NSString *)sizeCategory {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:sizeCategory forKey:TCSizeCategory];
}

@end
