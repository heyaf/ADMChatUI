//
//  ADMChatDBManager.m
//  ADMChat
//
//  Created by WangKai on 2021/7/29.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMChatDBManager.h"
#import "ADMChatSqliteManager.h"
#import "ADMChatMessageModel.h"

NSString *const ADM_USER    = @"ADM_user";
NSString *const ADM_GROUP   = @"ADM_group";
NSString *const ADM_SESSION = @"ADM_session";

@implementation ADMChatDBManager

+ (instancetype)DBManager {
    static ADMChatDBManager *DBManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DBManager = [[ADMChatDBManager alloc] init];
    });
    return DBManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //输入框草稿
        _draftDic = [[NSMutableDictionary alloc] init];
        //创建三张表 <user, group, session>
        [[ADMChatSqliteManager defaultManager] createTableName:ADM_USER modelClass:[ADMChatUserModel class]];
        [[ADMChatSqliteManager defaultManager] createTableName:ADM_GROUP modelClass:[ADMChatGroupModel class]];
        [[ADMChatSqliteManager defaultManager] createTableName:ADM_SESSION modelClass:[ADMChatSessionModel class]];
    }
    return self;
}

//草稿
- (NSString *)draftWithModel:(ADMChatBaseModel *)model {
    NSString *key = [self tableNameWithModel:model];
    NSString *draft = [_draftDic objectForKey:key];
    if (draft == nil || ![draft isKindOfClass:[NSString class]]) {
        draft = @"";
    }
    return draft;
}

//删除草稿
- (void)removeDraftWithModel:(ADMChatBaseModel *)model {
    NSString *key = [self tableNameWithModel:model];
    [_draftDic removeObjectForKey:key];
}

//保存草稿
- (void)setDraft:(NSString *)draft model:(ADMChatBaseModel *)model {
    if (draft == nil || ![draft isKindOfClass:[NSString class]]) {
        draft = @"";
    }
    NSString *key = [self tableNameWithModel:model];
    [_draftDic setObject:draft forKey:key];
}

#pragma mark - user表操纵
//所有用户
- (NSMutableArray *)users {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",ADM_USER];
    NSArray *list = [[ADMChatSqliteManager defaultManager] selectWithSql:sql];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:list.count];
    for (NSDictionary *dic in list) {
        ADMChatUserModel *model = [ADMChatUserModel modelWithDic:dic];
        [arr addObject:model];
    }
    return arr;
}

//添加用户
- (void)insertUserModel:(ADMChatUserModel *)model {
    [[ADMChatSqliteManager defaultManager] insertModel:model tableName:ADM_USER];
}

//更新用户
- (void)updateUserModel:(ADMChatUserModel *)model {
    [[ADMChatSqliteManager defaultManager] updateModel:model tableName:ADM_USER primkey:@"uid"];
}

//查询用户
- (ADMChatUserModel *)selectUserModel:(NSString *)uid {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE uid = '%@'",ADM_USER,uid];
    NSArray *list = [[ADMChatSqliteManager defaultManager] selectWithSql:sql];
    if (list.count > 0) {
        ADMChatUserModel *model = [ADMChatUserModel modelWithDic:list.firstObject];
        return model;
    }
    return nil;
}

//删除用户
- (void)deleteUserModel:(NSString *)uid {
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE uid = '%@'",ADM_USER,uid];
    [[ADMChatSqliteManager defaultManager] execute:sql];
    //同时删除对应的会话和消息记录
    [self deleteSessionModel:uid];
    [self deleteMessageWithUid:uid];
}

#pragma mark - group表操纵
//所有群
- (NSMutableArray *)groups {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",ADM_GROUP];
    NSArray *list = [[ADMChatSqliteManager defaultManager] selectWithSql:sql];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:list.count];
    for (NSDictionary *dic in list) {
        ADMChatGroupModel *model = [ADMChatGroupModel modelWithDic:dic];
        [arr addObject:model];
    }
    return arr;
}

//添加群
- (void)insertGroupModel:(ADMChatGroupModel *)model {
    [[ADMChatSqliteManager defaultManager] insertModel:model tableName:ADM_GROUP];
}

//更新群
- (void)updateGroupModel:(ADMChatGroupModel *)model {
    [[ADMChatSqliteManager defaultManager] updateModel:model tableName:ADM_GROUP primkey:@"gid"];
}

//查询群
- (ADMChatGroupModel *)selectGroupModel:(NSString *)gid {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE gid = '%@'",ADM_GROUP,gid];
    NSArray *list = [[ADMChatSqliteManager defaultManager] selectWithSql:sql];
    if (list.count > 0) {
        ADMChatGroupModel *model = [ADMChatGroupModel modelWithDic:list.firstObject];
        return model;
    }
    return nil;
}

//删除群
- (void)deleteGroupModel:(NSString *)gid {
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE gid = '%@'",ADM_GROUP,gid];
    [[ADMChatSqliteManager defaultManager] execute:sql];
    //同时删除对应的会话和消息记录
    [self deleteSessionModel:gid];
    [self deleteMessageWithGid:gid];
}

#pragma mark - session表操纵
//所有会话
- (NSMutableArray *)sessions {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",ADM_SESSION];
    NSArray *list = [[ADMChatSqliteManager defaultManager] selectWithSql:sql];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:list.count];
    for (NSDictionary *dic in list) {
        ADMChatSessionModel *model = [ADMChatSessionModel modelWithDic:dic];
        [arr addObject:model];
    }
    [arr sortUsingSelector:@selector(compareOtherModel:)];
    return arr;
}

//添加会话
- (void)insertSessionModel:(ADMChatSessionModel *)model {
    [[ADMChatSqliteManager defaultManager] insertModel:model tableName:ADM_SESSION];
}

//更新会话
- (void)updateSessionModel:(ADMChatSessionModel *)model {
    [[ADMChatSqliteManager defaultManager] updateModel:model tableName:ADM_SESSION primkey:@"sid"];
}

//查询私聊会话
- (ADMChatSessionModel *)selectSessionModelWithUser:(ADMChatUserModel *)userModel {
    return [self selectSessionModel:userModel];
}

//查询群聊会话
- (ADMChatSessionModel *)selectSessionModelWithGroup:(ADMChatGroupModel *)groupModel {
    return [self selectSessionModel:groupModel];
}

//private
- (ADMChatSessionModel *)selectSessionModel:(ADMChatBaseModel *)model {
    NSString *sid, *name, *avatar; BOOL isGroup;
    if ([model isKindOfClass:[ADMChatUserModel class]]) {
        ADMChatUserModel *user = (ADMChatUserModel *)model;
        sid = user.uid;
        name = user.name;
        avatar = user.avatar;
        isGroup = NO;
    }
    else {
        ADMChatGroupModel *group = (ADMChatGroupModel *)model;
        sid = group.gid;
        name = group.name;
        avatar = group.avatar;
        isGroup = YES;
    }
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE sid = '%@'",ADM_SESSION,sid];
    NSArray *list = [[ADMChatSqliteManager defaultManager] selectWithSql:sql];
    ADMChatSessionModel *session;
    if (list.count > 0) {
        session = [ADMChatSessionModel modelWithDic:list.firstObject];
    }
    else {
        //创建会话,并插入数据库
        session = [[ADMChatSessionModel alloc] init];
        session.sid = sid;
        session.name = name;
        session.avatar = avatar;
        session.cluster = isGroup;
        [self insertSessionModel:session];
    }
    return session;
}

//删除会话
- (void)deleteSessionModel:(NSString *)sid {
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE sid = '%@'",ADM_SESSION,sid];
    [[ADMChatSqliteManager defaultManager] execute:sql];
}

///查询会话对应的用户或者群聊
- (ADMChatBaseModel *)selectChatModel:(ADMChatSessionModel *)model {
    if (model.isCluster) {
        return [self selectGroupModel:model.sid];
    }
    else {
        return [self selectUserModel:model.sid];
    }
}

//查询会话对应的用户
- (ADMChatUserModel *)selectChatUserModel:(ADMChatSessionModel *)model {
    return [self selectUserModel:model.sid];
}

//查询会话对应的群聊
- (ADMChatGroupModel *)selectChatGroupModel:(ADMChatSessionModel *)model {
    return [self selectGroupModel:model.sid];
}

#pragma mark - message表操纵
//删除私聊消息记录
- (void)deleteMessageWithUid:(NSString *)uid {
    NSString *tableName = [self tableNameWithUid:uid];
    [[ADMChatSqliteManager defaultManager] deleteTableName:tableName];
}

//删除群聊消息记录
- (void)deleteMessageWithGid:(NSString *)gid {
    NSString *tableName = [self tableNameWithUid:gid];
    [[ADMChatSqliteManager defaultManager] deleteTableName:tableName];
}

//私聊消息
- (NSMutableArray *)messagesWithUser:(ADMChatUserModel *)model {
    return [self messagesWithModel:model];
}

//群聊消息
- (NSMutableArray *)messagesWithGroup:(ADMChatGroupModel *)model {
    return [self messagesWithModel:model];
}

//private
- (NSMutableArray *)messagesWithModel:(ADMChatBaseModel *)model {
    NSString *tableName = [self tableNameWithModel:model];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY timestmp DESC LIMIT 100",tableName];
    NSArray *list = [[ADMChatSqliteManager defaultManager] selectWithSql:sql];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:list.count];
    for (NSDictionary *dic in list) {
        ADMChatMessageModel *model = [ADMChatMessageModel modelWithDic:dic];
        [arr insertObject:model atIndex:0];
    }
    return arr;
}

//插入私聊消息
- (void)insertMessage:(ADMChatMessageModel *)message chatWithUser:(ADMChatUserModel *)model {
    [self insertMessage:message chatWithModel:model];
}

//插入群聊消息
- (void)insertMessage:(ADMChatMessageModel *)message chatWithGroup:(ADMChatGroupModel *)model {
    [self insertMessage:message chatWithModel:model];
}

//private
- (void)insertMessage:(ADMChatMessageModel *)message chatWithModel:(ADMChatBaseModel *)model{
    ADMChatSessionModel *session = [self selectSessionModel:model];
    session.lastMsg = message.message;
    session.lastTimestmp = message.timestmp;
    [self updateSessionModel:session];
    
    NSString *tableName = [self tableNameWithModel:model];
    [[ADMChatSqliteManager defaultManager] createTableName:tableName modelClass:[message class]];
    [[ADMChatSqliteManager defaultManager] insertModel:message tableName:tableName];
}

//更新私聊消息
- (void)updateMessageModel:(ADMChatMessageModel *)message chatWithUser:(ADMChatUserModel *)model {
    NSString *tableName = [self tableNameWithModel:model];
    [[ADMChatSqliteManager defaultManager] updateModel:message tableName:tableName primkey:@"mid"];
}

//更新群聊消息
- (void)updateMessageModel:(ADMChatMessageModel *)message chatWithGroup:(ADMChatGroupModel *)model {
    NSString *tableName = [self tableNameWithModel:model];
    [[ADMChatSqliteManager defaultManager] updateModel:message tableName:tableName primkey:@"mid"];
}

//删除私聊消息
- (void)deleteMessageModel:(ADMChatMessageModel *)message chatWithUser:(ADMChatUserModel *)model {
    NSString *tableName = [self tableNameWithModel:model];
    [[ADMChatSqliteManager defaultManager] deleteModel:message tableName:tableName primkey:@"mid"];
}

//删除群聊消息
- (void)deleteMessageModel:(ADMChatMessageModel *)message chatWithGroup:(ADMChatGroupModel *)model {
    NSString *tableName = [self tableNameWithModel:model];
    [[ADMChatSqliteManager defaultManager] deleteModel:message tableName:tableName primkey:@"mid"];
}

//private
- (NSString *)tableNameWithModel:(ADMChatBaseModel *)model {
    if ([model isKindOfClass:[ADMChatUserModel class]]) {
        ADMChatUserModel *user = (ADMChatUserModel *)model;
        return [self tableNameWithUid:user.uid];
    }
    else {
        ADMChatGroupModel *group = (ADMChatGroupModel *)model;
        return [self tableNameWithGid:group.gid];
    }
}

- (NSString *)tableNameWithUid:(NSString *)uid {
    return [NSString stringWithFormat:@"user_%@",uid];
}

- (NSString *)tableNameWithGid:(NSString *)gid {
    return [NSString stringWithFormat:@"group_%@",gid];
}

@end
