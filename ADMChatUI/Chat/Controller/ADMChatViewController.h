//
//  ADMChatViewController.h
//  ADMChat
//
//  Created by WangKai on 2018/9/4.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADMChat.h"

@interface ADMChatViewController : UIViewController

///选择用户进入聊天
- (instancetype)initWithUser:(ADMChatUserModel *)userModel;

///选择群进入聊天
- (instancetype)initWithGroup:(ADMChatGroupModel *)groupModel;

///选择会话进入聊天
- (instancetype)initWithSession:(ADMChatSessionModel *)sessionModel;

@end
