//
//  ADMUserTableViewCell.m
//  ADMChat
//
//  Created by WangKai on 2021/7/30.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMUserTableViewCell.h"
#import "UIView+ADMChat.h"
#import "WZChatMacro.h"

@implementation ADMUserTableViewCell {
    UIImageView *_avatarImageView;
    UILabel *_nameLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 40, 40)];
        _avatarImageView.chat_cornerRadius = 5;
        [self.contentView addSubview:_avatarImageView];
        
        CGFloat nickX = _avatarImageView.chat_maxX+15;
        CGFloat nickW = CHAT_SCREEN_WIDTH-nickX-20;
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(nickX, 0, nickW, 60)];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.textColor = [UIColor darkTextColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_nameLabel];
    }
    return self;
}

- (void)setConfig:(ADMChatUserModel *)model {
    [ADMChatHelper getImageWithUrl:model.avatar placeholder:CHAT_BAD_IMAGE completion:^(UIImage *image) {
        _avatarImageView.image = image;
    }];
    _nameLabel.text = model.name;
}

@end
