//
//  ADMEmoticonCell.m
//  ADMChat
//
//  Created by WangKai on 2019/5/16.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import "ADMEmoticonCell.h"
#import "ADMInputHelper.h"

@implementation ADMEmoticonCell {
    UIImageView *_emoticonImageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _emoticonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(9, 6, 35, 35)];
        [self.contentView addSubview:_emoticonImageView];
    }
    return self;
}

- (void)setConfig:(NSString *)image {
    _emoticonImageView.image = [ADMInputHelper emoticonImageNamed:image];
}

@end
