//
//  ADMChatBaseCell.m
//  ADMChat
//
//  Created by WangKai on 2019/1/15.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMChatBaseCell.h"

@implementation ADMChatBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setConfig:(ADMChatMessageModel *)model {}
- (void)setConfig:(ADMChatMessageModel *)model isShowName:(BOOL)isShowName {}

@end
