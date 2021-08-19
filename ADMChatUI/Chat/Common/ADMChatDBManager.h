//
//  ADMChatDBManager.h
//  ADMChat
//
//  Created by WangKai on 2021/7/29.
//  Copyright © 2021 WangKai. All rights reserved.
//  数据库操纵

#import <Foundation/Foundation.h>
#import "ADMChatBaseModel.h"
#import "ADMChatUserModel.h"
#import "ADMChatGroupModel.h"
#import "ADMChatSessionModel.h"
#import "ADMChatMessageModel.h"

@interface ADMChatDBManager : NSObject

///输入框草稿
@property (nonatomic, strong) NSMutableDictionary *draftDic;
///草稿
- (NSString *)draftWithModel:(ADMChatBaseModel *)model;
///删除草稿
- (void)removeDraftWithModel:(ADMChatBaseModel *)model;
///保存草稿
- (void)setDraft:(NSString *)draft model:(ADMChatBaseModel *)model;

+ (instancetype)DBManager;

#pragma mark - user表操纵
///所有用户
- (NSMutableArray *)users;
///添加用户
- (void)insertUserModel:(ADMChatUserModel *)model;
///更新用户
- (void)updateUserModel:(ADMChatUserModel *)model;
///查询用户
- (ADMChatUserModel *)selectUserModel:(NSString *)uid;
///删除用户
- (void)deleteUserModel:(NSString *)uid;

#pragma mark - group表操纵
///所有群
- (NSMutableArray *)groups;
///添加群
- (void)insertGroupModel:(ADMChatGroupModel *)model;
///更新群
- (void)updateGroupModel:(ADMChatGroupModel *)model;
///查询群
- (ADMChatGroupModel *)selectGroupModel:(NSString *)gid;
///删除群
- (void)deleteGroupModel:(NSString *)gid;

#pragma mark - session表操纵
///所有会话
- (NSMutableArray *)sessions;
///添加会话
- (void)insertSessionModel:(ADMChatSessionModel *)model;
///更新会话
- (void)updateSessionModel:(ADMChatSessionModel *)model;
///查询私聊会话
- (ADMChatSessionModel *)selectSessionModelWithUser:(ADMChatUserModel *)userModel;
///查询群聊会话
- (ADMChatSessionModel *)selectSessionModelWithGroup:(ADMChatGroupModel *)groupModel;
///删除会话
- (void)deleteSessionModel:(NSString *)sid;
///查询会话对应的用户或者群聊
- (ADMChatBaseModel *)selectChatModel:(ADMChatSessionModel *)model;
///查询会话对应的用户
- (ADMChatUserModel *)selectChatUserModel:(ADMChatSessionModel *)model;
///查询会话对应的群聊
- (ADMChatGroupModel *)selectChatGroupModel:(ADMChatSessionModel *)model;

#pragma mark - message表操纵
///删除私聊消息记录
- (void)deleteMessageWithUid:(NSString *)uid;
///删除群聊消息记录
- (void)deleteMessageWithGid:(NSString *)gid;
//私聊消息列表
- (NSMutableArray *)messagesWithUser:(ADMChatUserModel *)model;
//群聊消息列表
- (NSMutableArray *)messagesWithGroup:(ADMChatGroupModel *)model;
///插入私聊消息
- (void)insertMessage:(ADMChatMessageModel *)message chatWithUser:(ADMChatUserModel *)model;
///插入群聊消息
- (void)insertMessage:(ADMChatMessageModel *)message chatWithGroup:(ADMChatGroupModel *)model;
///更新私聊消息
- (void)updateMessageModel:(ADMChatMessageModel *)message chatWithUser:(ADMChatUserModel *)model;
///更新群聊消息
- (void)updateMessageModel:(ADMChatMessageModel *)message chatWithGroup:(ADMChatGroupModel *)model;
///删除私聊消息
- (void)deleteMessageModel:(ADMChatMessageModel *)message chatWithUser:(ADMChatUserModel *)model;
///删除群聊消息
- (void)deleteMessageModel:(ADMChatMessageModel *)message chatWithGroup:(ADMChatGroupModel *)model;

@end
