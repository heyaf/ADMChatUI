//
//  ADMChatUserModel.m
//  ADMChat
//
//  Created by WangKai on 2021/7/24.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMChatUserModel.h"

@implementation ADMChatUserModel

///默认登录用户
+ (instancetype)shareInfo {
    static ADMChatUserModel *userInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[ADMChatUserModel alloc] init];
        userInfo.uid = @"00001";
        userInfo.name = @"无敌是多么的寂寞";
        userInfo.avatar = @"http://sqb.wowozhe.com/images/home/wx_appicon.png";
    });
    return userInfo;
}

@end
