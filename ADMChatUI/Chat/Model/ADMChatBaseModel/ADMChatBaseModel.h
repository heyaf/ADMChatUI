//
//  ADMChatBaseModel.h
//  ADMChat
//
//  Created by WangKai on 2021/7/26.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADMChatBaseModel : NSObject<NSCoding>

///将字典转化为model
+ (instancetype)modelWithDic:(NSDictionary *)dic;

///将model转化为字典
- (NSDictionary *)transfromDictionary;

///获取类的所有属性名称与类型, 使用ADMChatBaseModel的子类调用
+ (NSArray *)allPropertyName;

///解档
+ (instancetype)chat_unarchiveObjectWithData:(NSData *)data;

@end

@interface NSData (ADMChatBaseModel)

///归档
+ (NSData *)chat_archivedDataWithModel:(ADMChatBaseModel *)model;

@end
