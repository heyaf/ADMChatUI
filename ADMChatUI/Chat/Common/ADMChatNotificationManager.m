//
//  ADMChatNotificationManager.m
//  ADMChat
//
//  Created by WangKai on 2021/7/30.
//  Copyright © 2021 WangKai. All rights reserved.
//  通知

#import "ADMChatNotificationManager.h"

@implementation ADMChatNotificationManager

//发送刷新session的通知
+ (void)postSessionNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ll.chat.session" object:nil];
}

//监听刷新session的通知
+ (void)observerSessionNotification:(id)instant sel:(SEL)sel {
    [[NSNotificationCenter defaultCenter] addObserver:instant selector:sel name:@"ll.chat.session" object:nil];
}

//移除通知
+ (void)removeObserver:(id)instant {
    [[NSNotificationCenter defaultCenter] removeObserver:instant];
}

@end
