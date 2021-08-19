//
//  ADMInputView.h
//  ADMKit_Example
//
//  Created by WangKai on 2021/8/19.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMBaseInputView.h"
#import "WZNInputEnum.h"
@protocol ADMInputViewDelegate;

@interface ADMInputView : ADMBaseInputView

@property (nonatomic, weak) id<ADMInputViewDelegate> delegate;

@end

@protocol ADMInputViewDelegate <NSObject>

@optional
///文本变化
- (void)inputView:(ADMInputView *)inputView didChangeText:(NSString *)text;
///发送文本消息
- (void)inputView:(ADMInputView *)inputView sendMessage:(NSString *)message;
///自定义键盘点击事件
- (void)inputView:(ADMInputView *)inputView didSelectMoreType:(WZInputMoreType)type;
///录音状态变化
- (void)inputView:(ADMInputView *)inputView didChangeRecordType:(ADMRecordType)type;
///输入框frame改变
- (void)inputView:(ADMInputView *)inputView willChangeFrameWithDuration:(CGFloat)duration;

@end
