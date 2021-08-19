//
//  ADMChatSessionModel.m
//  ADMChat
//
//  Created by WangKai on 2021/7/29.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMChatSessionModel.h"

@implementation ADMChatSessionModel

///时间戳排序
- (NSComparisonResult)compareOtherModel:(ADMChatSessionModel *)model {
    return self.lastTimestmp < model.lastTimestmp;
}

@end
