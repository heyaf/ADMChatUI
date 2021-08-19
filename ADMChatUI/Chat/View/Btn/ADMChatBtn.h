//
//  ADMChatBtn.h
//  ADMChat
//
//  Created by WangKai on 2018/9/4.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ADMChatButtonTypeNormal = 0,   //系统默认类型
    ADMChatButtonTypeRetry,        //重发消息按钮
}ADMChatButtonType;

@interface ADMChatBtn : UIButton

+ (instancetype)chatButtonWithType:(ADMChatButtonType)type;

@end
