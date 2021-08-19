//
//  ADMChatMessageCell.h
//  ADMChat
//
//  Created by WangKai on 2018/9/4.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import "ADMChatBaseCell.h"

@interface ADMChatMessageCell : ADMChatBaseCell {
    UILabel *_nickLabel;
    UIImageView *_avatarImageView;
    UIImageView *_bubbleImageView;
    UIActivityIndicatorView *_activityView;
    
    CGRect _contentRect;
}

@end
