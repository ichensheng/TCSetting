//
//  TCSizeManager.h
//  TCTools
//
//  Created by 陈 胜 on 16/5/25.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  字体大小分类
 */
UIKIT_EXTERN NSString * const TCFontTextStyle10;
UIKIT_EXTERN NSString * const TCFontTextStyle12;
UIKIT_EXTERN NSString * const TCFontTextStyle14;
UIKIT_EXTERN NSString * const TCFontTextStyle15;
UIKIT_EXTERN NSString * const TCFontTextStyle16;
UIKIT_EXTERN NSString * const TCFontTextStyle17;


/**
 *  cell高度分类
 */
UIKIT_EXTERN NSString * const TCCellHeightStyle39;
UIKIT_EXTERN NSString * const TCCellHeightStyle44;
UIKIT_EXTERN NSString * const TCCellHeightStyle45;
UIKIT_EXTERN NSString * const TCCellHeightStyle55;
UIKIT_EXTERN NSString * const TCCellHeightStyle88;

/**
 *  icon尺寸分类
 */
UIKIT_EXTERN NSString * const TCIconSizeStyle17;
UIKIT_EXTERN NSString * const TCIconSizeStyle20;
UIKIT_EXTERN NSString * const TCIconSizeStyle23;
UIKIT_EXTERN NSString * const TCIconSizeStyle25;
UIKIT_EXTERN NSString * const TCIconSizeStyle33;
UIKIT_EXTERN NSString * const TCIconSizeStyle36;
UIKIT_EXTERN NSString * const TCIconSizeStyle40;
UIKIT_EXTERN NSString * const TCIconSizeStyle45;
UIKIT_EXTERN NSString * const TCIconSizeStyle64;
UIKIT_EXTERN NSString * const TCIconSizeStyle70;
UIKIT_EXTERN NSString * const TCIconSizeStyle71;
UIKIT_EXTERN NSString * const TCIconSizeStyle72;

@interface TCSizeManager : NSObject

/**
 *  通过字体尺寸类型获取字体大小
 *
 *  @param textStyle 文本字体尺寸类型
 *  @param offset    偏移量
 *
 *  @return 字体大小
 */
+ (CGFloat)fontSizeForTextStyle:(NSString *)textStyle
                         offset:(CGFloat)offset;

/**
 *  通过字体尺寸类型获取字体大小
 *
 *  @param textStyle 文本字体尺寸类型
 *
 *  @return 字体大小
 */
+ (CGFloat)fontSizeForTextStyle:(NSString *)textStyle;

/**
 *  聊天也没字体大小
 *
 *
 *  @return 字体大小
 */
+ (CGFloat)chatFontSize;

/**
 *  通过cell高度类型获取不同UI尺寸的cell高度
 *
 *  @param heightStyle cell高度类型
 *
 *  @return cell高度
 */
+ (CGFloat)cellHeightWithStyle:(NSString *)heightStyle;

/**
 *  通过icon高度类型获取不同UI尺寸的icon size
 *
 *  @param iconSizeStyle icon size类型
 *
 *  @return icon size
 */
+ (CGSize)iconSizeWithStyle:(NSString *)iconSizeStyle;

/**
 *  获取tabBar的高度
 *
 *  @return tabBar高度
 */
+ (CGFloat)tabBarHeight;

/**
 *  获取当前UI尺寸类型
 *
 *  @return UI尺寸类型
 */
+ (NSString *)sizeCategory;

@end
