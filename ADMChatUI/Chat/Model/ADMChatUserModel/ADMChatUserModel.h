//
//  ADMChatUserModel.h
//  ADMChat
//
//  Created by WangKai on 2021/7/24.
//  Copyright © 2021 WangKai. All rights reserved.
//  聊天用户

#import "ADMChatBaseModel.h"

@interface ADMChatUserModel : ADMChatBaseModel

///用户id
@property (nonatomic, strong) NSString *uid;
///用户昵称
@property (nonatomic, strong) NSString *name;
///用户头像
@property (nonatomic, strong) NSString *avatar;
///聊天界面是否显示用户昵称
@property (nonatomic, assign, getter=isShowName) BOOL showName;

///默认登录用户
+ (instancetype)shareInfo;

@end
