//
//  ADMInputHelper.h
//  ADMKit_Example
//
//  Created by WangKai on 2021/8/22.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADMInputHelper : NSObject

+ (instancetype)helper;

///还原, 如屏幕旋转时
- (void)reset;
///是否是iPad
- (BOOL)iPad;
///是否是iPhone
- (BOOL)iPhone;
///是否是iPhoneX
- (BOOL)iPhoneX;
///导航高
- (CGFloat)navBarH;
///状态栏高
- (CGFloat)statusH;
///taBar高
- (CGFloat)tabBarH;
///屏幕宽
- (CGFloat)screenW;
///屏幕高
- (CGFloat)screenH;
///屏幕scale
- (CGFloat)screenScale;
///屏幕bounds
- (CGRect)screenBounds;
///iPhoneX底部高度
- (CGFloat)iPhoneXBottomH;

///图片
+ (UIImage *)otherImageNamed:(NSString *)name;
+ (UIImage *)emoticonImageNamed:(NSString *)name;

@end
