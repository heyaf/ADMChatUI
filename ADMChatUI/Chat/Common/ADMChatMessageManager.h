//
//  ADMChatMessageManager.h
//  ADMChat
//
//  Created by WangKai on 2021/7/24.
//  Copyright © 2021 WangKai. All rights reserved.
//  消息管理

#import <UIKit/UIKit.h>
#import "ADMChatMessageModel.h"
#import "ADMChatUserModel.h"

@interface ADMChatMessageManager : NSObject

#pragma mark - 创建消息模型
//创建系统消息
+ (ADMChatMessageModel *)createSystemMessage:(ADMChatUserModel *)userModel
                                    message:(NSString *)message
                                   isSender:(BOOL)isSender;

///创建文本消息
+ (ADMChatMessageModel *)createTextMessage:(ADMChatUserModel *)userModel
                                  message:(NSString *)message
                                 isSender:(BOOL)isSender;

///创建录音消息
+ (ADMChatMessageModel *)createVoiceMessage:(ADMChatUserModel *)userModel
                                  duration:(NSInteger)duration
                                  voiceUrl:(NSString *)voiceUrl
                                  isSender:(BOOL)isSender;

///创建图片消息
+ (ADMChatMessageModel *)createImageMessage:(ADMChatUserModel *)userModel
                                 thumbnail:(NSString *)thumbnail
                                  original:(NSString *)original
                                 thumImage:(UIImage *)thumImage
                                  oriImage:(UIImage *)oriImage
                                  isSender:(BOOL)isSender;

///创建视频消息
+ (ADMChatMessageModel *)createVideoMessage:(ADMChatUserModel *)userModel
                                  videoUrl:(NSString *)videoUrl
                                  coverUrl:(NSString *)coverUrl
                                coverImage:(UIImage *)coverImage
                                  isSender:(BOOL)isSender;

@end
