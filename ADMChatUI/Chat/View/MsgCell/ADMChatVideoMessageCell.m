//
//  ADMChatVideoMessageCell.m
//  ADMChat
//
//  Created by WangKai on 2019/5/22.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMChatVideoMessageCell.h"
#import "ADMChatHelper.h"
#import "WZChatMacro.h"

@implementation ADMChatVideoMessageCell {
    UIImageView *_markImageView;
    UIImageView *_contentImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.layer.masksToBounds = YES;
        _contentImageView.layer.cornerRadius = 5;
        [self.contentView addSubview:_contentImageView];
        
        _markImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _markImageView.image = [ADMInputHelper otherImageNamed:@"ADM_chat_video_mark"];
        [self.contentView addSubview:_markImageView];
    }
    return self;
}

- (void)setConfig:(ADMChatMessageModel *)model isShowName:(BOOL)isShowName {
    [super setConfig:model isShowName:isShowName];
    
    _contentImageView.frame = _contentRect;
    _markImageView.center = _contentImageView.center;
    
    [ADMChatHelper getImageWithUrl:model.coverUrl placeholder:CHAT_BAD_IMAGE completion:^(UIImage *image) {
        _contentImageView.image = image;
    }];
}

@end
