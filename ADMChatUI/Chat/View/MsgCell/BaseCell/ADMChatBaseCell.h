//
//  ADMChatBaseCell.h
//  ADMChat
//
//  Created by WangKai on 2019/1/15.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADMChatMessageModel.h"

@interface ADMChatBaseCell : UITableViewCell

///系统消息 - 比如：时间消息等
- (void)setConfig:(ADMChatMessageModel *)model;

///其他消息 - 比如：文本、图片消息等
- (void)setConfig:(ADMChatMessageModel *)model isShowName:(BOOL)isShowName;

@end
