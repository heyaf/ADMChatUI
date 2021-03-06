//
//  ADMChatTextMessageCell.m
//  ADMChat
//
//  Created by WangKai on 2018/9/4.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import "ADMChatTextMessageCell.h"

@implementation ADMChatTextMessageCell {
    UILabel *_contentLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor darkTextColor];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
    }
    return self;
}

- (void)setConfig:(ADMChatMessageModel *)model isShowName:(BOOL)isShowName {
    [super setConfig:model isShowName:isShowName];
    _contentLabel.frame = _contentRect;
    _contentLabel.attributedText = [model attributedString];
    if (model.modelW > 30) {
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    else {
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
}

@end
