//
//  ADMEmojisCell.m
//  ADMChat
//
//  Created by WangKai on 2018/9/5.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import "ADMEmojisCell.h"

@implementation ADMEmojisCell {
    UILabel *_emojisLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _emojisLabel = [[UILabel alloc] initWithFrame:CGRectMake(4, 0, 45, 45)];
        _emojisLabel.font = [UIFont systemFontOfSize:33];
        _emojisLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_emojisLabel];
    }
    return self;
}

- (void)setConfig:(NSString *)emojis {
    _emojisLabel.text = emojis;
}

@end
