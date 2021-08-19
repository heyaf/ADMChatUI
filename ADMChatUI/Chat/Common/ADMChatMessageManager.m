//
//  ADMChatMessageManager.m
//  ADMChat
//
//  Created by WangKai on 2021/7/24.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMChatMessageManager.h"
#import "ADMChatUserModel.h"
#import "ADMChatHelper.h"

@implementation ADMChatMessageManager

#pragma mark - 创建消息模型
//创建系统消息
+ (ADMChatMessageModel *)createSystemMessage:(ADMChatUserModel *)userModel
                                    message:(NSString *)message
                                   isSender:(BOOL)isSender {
    ADMChatMessageModel *msgModel = [[ADMChatMessageModel alloc] init];
    msgModel.msgType = ADMMessageTypeSystem;
    msgModel.message = message;
    [self setConfig:msgModel userModel:userModel isSender:isSender];
    return msgModel;
}

//创建文本消息
+ (ADMChatMessageModel *)createTextMessage:(ADMChatUserModel *)userModel
                                  message:(NSString *)message
                                 isSender:(BOOL)isSender {
    ADMChatMessageModel *msgModel = [[ADMChatMessageModel alloc] init];
    msgModel.msgType = ADMMessageTypeText;
    msgModel.message = message;
    [self setConfig:msgModel userModel:userModel isSender:isSender];
    return msgModel;
}

//创建录音消息
+ (ADMChatMessageModel *)createVoiceMessage:(ADMChatUserModel *)userModel
                                  duration:(NSInteger)duration
                                  voiceUrl:(NSString *)voiceUrl
                                  isSender:(BOOL)isSender {
    ADMChatMessageModel *msgModel = [[ADMChatMessageModel alloc] init];
    msgModel.msgType = ADMMessageTypeVoice;
    msgModel.message = @"[语音]";
    msgModel.duration = duration;
    msgModel.voiceUrl = voiceUrl;
    [self setConfig:msgModel userModel:userModel isSender:isSender];
    return msgModel;
}

//创建图片消息
+ (ADMChatMessageModel *)createImageMessage:(ADMChatUserModel *)userModel
                                 thumbnail:(NSString *)thumbnail
                                  original:(NSString *)original
                                 thumImage:(UIImage *)thumImage
                                  oriImage:(UIImage *)oriImage
                                  isSender:(BOOL)isSender {
    ADMChatMessageModel *msgModel = [[ADMChatMessageModel alloc] init];
    msgModel.msgType   = ADMMessageTypeImage;
    msgModel.message   = @"[图片]";
    msgModel.thumbnail = thumbnail;
    msgModel.original  = original;
    msgModel.imgW = oriImage.size.width;
    msgModel.imgH = oriImage.size.height;
    //将图片保存到本地
    [ADMChatHelper storeImage:oriImage forKey:original];
    [ADMChatHelper storeImage:thumImage forKey:thumbnail];
    [self setConfig:msgModel userModel:userModel isSender:isSender];
    return msgModel;
}

//创建视频消息
+ (ADMChatMessageModel *)createVideoMessage:(ADMChatUserModel *)userModel
                                  videoUrl:(NSString *)videoUrl
                                  coverUrl:(NSString *)coverUrl
                                coverImage:(UIImage *)coverImage
                                  isSender:(BOOL)isSender {
    ADMChatMessageModel *msgModel = [[ADMChatMessageModel alloc] init];
    msgModel.msgType   = ADMMessageTypeVideo;
    msgModel.message   = @"[视频]";
    msgModel.videoUrl = videoUrl;
    msgModel.coverUrl  = coverUrl;
    msgModel.imgW = coverImage.size.width;
    msgModel.imgH = coverImage.size.height;
    //将封面图片保存到本地
    [ADMChatHelper storeImage:coverImage forKey:coverUrl];
    [self setConfig:msgModel userModel:userModel isSender:isSender];
    return msgModel;
}

#pragma mark - pravite
+ (void)setConfig:(ADMChatMessageModel *)msgModel userModel:(ADMChatUserModel *)userModel isSender:(BOOL)isSender {
    if (isSender) {
        msgModel.uid    = [ADMChatUserModel shareInfo].uid;
        msgModel.name   = [ADMChatUserModel shareInfo].name;
        msgModel.avatar = [ADMChatUserModel shareInfo].avatar;
    }
    else {
        msgModel.uid    = userModel.uid;
        msgModel.name   = userModel.name;
        msgModel.avatar = userModel.avatar;
    }
    msgModel.sender  = isSender;
    msgModel.sendType  = ADMMessageSendTypeWaiting;
    msgModel.timestmp  = [ADMChatHelper nowTimestamp];
}

@end
