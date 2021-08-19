//
//  NSDateFormatter+ADMChat.m
//  ADMChat
//
//  Created by WangKai on 2021/8/20.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "NSDateFormatter+ADMChat.h"

@implementation NSDateFormatter (ADMChat)

+ (NSMutableDictionary *)formatterCache {
    static dispatch_once_t onceToken;
    static NSMutableDictionary *cache;
    dispatch_once(&onceToken, ^{
        cache = [NSMutableDictionary dictionaryWithCapacity:0];
    });
    return cache;
}

+ (NSDateFormatter *)chat_defaultDateFormatter {
    NSString *f = @"yyyy-MM-dd HH:mm:ss";
    return [self chat_dateFormatter:f];
}

+ (NSDateFormatter *)chat_detailDateFormatter{
    NSString *f = @"yyyy-MM-dd HH:mm:ss.SSS EEEE";
    return [self chat_dateFormatter:f];
}

+ (NSDateFormatter *)chat_dateFormatter:(NSString *)f {
    NSDateFormatter *formatter = [[self formatterCache] objectForKey:f];
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:f];
        [[self formatterCache] setObject:formatter forKey:f];
    }
    return formatter;
}

@end
