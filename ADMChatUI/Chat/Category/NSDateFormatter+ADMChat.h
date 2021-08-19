//
//  NSDateFormatter+ADMChat.h
//  ADMChat
//
//  Created by WangKai on 2021/8/20.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (ADMChat)

+ (NSDateFormatter *)chat_defaultDateFormatter;
+ (NSDateFormatter *)chat_detailDateFormatter;
+ (NSDateFormatter *)chat_dateFormatter:(NSString *)f;

@end
