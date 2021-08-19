//
//  ADMDeleteCell.m
//  ADMChat
//
//  Created by WangKai on 2018/9/5.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import "ADMDeleteCell.h"
#import "ADMInputHelper.h"

@implementation ADMDeleteCell {
    UIImageView *_deleteImgView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _deleteImgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 5, 40, 40)];
        _deleteImgView.image = [ADMInputHelper otherImageNamed:@"ADM_chat_delete"];
        [self.contentView addSubview:_deleteImgView];
    }
    return self;
}

@end
