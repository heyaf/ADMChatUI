//
//  ADMChatImageMessageCell.m
//  ADMChat
//
//  Created by WangKai on 2018/9/4.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import "ADMChatImageMessageCell.h"
#import "ADMChatHelper.h"
#import "WZChatMacro.h"

@implementation ADMChatImageMessageCell {
    UIImageView *_contentImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.layer.masksToBounds = YES;
        _contentImageView.layer.cornerRadius = 5;
        [self.contentView addSubview:_contentImageView];
    }
    return self;
}

- (void)setConfig:(ADMChatMessageModel *)model isShowName:(BOOL)isShowName {
    [super setConfig:model isShowName:isShowName];
    
    _contentImageView.frame = _contentRect;
    
    [ADMChatHelper getImageWithUrl:model.thumbnail placeholder:CHAT_BAD_IMAGE completion:^(UIImage *image) {
        _contentImageView.image = image;
    }];
}

@end
