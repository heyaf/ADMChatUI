//
//  ADMChatNotificationManager.h
//  ADMChat
//
//  Created by WangKai on 2021/7/30.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADMChatNotificationManager : NSObject

///发送刷新session的通知
+ (void)postSessionNotification;
///监听刷新session的通知
+ (void)observerSessionNotification:(id)instant sel:(SEL)sel;
///移除通知
+ (void)removeObserver:(id)instant;

@end
