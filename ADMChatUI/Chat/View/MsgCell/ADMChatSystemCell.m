//
//  ADMChatSystemCell.m
//  ADMChat
//
//  Created by WangKai on 2019/1/15.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMChatSystemCell.h"
#import "WZChatMacro.h"

@implementation ADMChatSystemCell {
    UILabel *_messageLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CHAT_SCREEN_WIDTH, 20)];
        _messageLabel.font = [UIFont systemFontOfSize:10];
        _messageLabel.textColor = [UIColor colorWithRed:100/255. green:100/255. blue:100/255. alpha:1];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_messageLabel];
    }
    return self;
}

- (void)setConfig:(ADMChatMessageModel *)model {
    _messageLabel.text = model.message;
}

@end
