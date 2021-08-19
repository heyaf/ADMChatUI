//
//  ADMChatGroupModel.h
//  ADMChat
//
//  Created by WangKai on 2021/7/29.
//  Copyright © 2021 WangKai. All rights reserved.
//  聊天群

#import "ADMChatBaseModel.h"

@interface ADMChatGroupModel : ADMChatBaseModel

///群id
@property (nonatomic, strong) NSString *gid;
///群昵称
@property (nonatomic, strong) NSString *name;
///群头像
@property (nonatomic, strong) NSString *avatar;
///聊天界面是否显示用户昵称
@property (nonatomic, assign, getter=isShowName) BOOL showName;

@end
