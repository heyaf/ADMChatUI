//
//  ADMChatBtn.m
//  ADMChat
//
//  Created by WangKai on 2018/9/4.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import "ADMChatBtn.h"

@interface ADMChatBtn ()

@property (nonatomic, assign) ADMChatButtonType type;

@end

@implementation ADMChatBtn

+ (instancetype)chatButtonWithType:(ADMChatButtonType)type{
    ADMChatBtn *baseBtn = [super buttonWithType:UIButtonTypeCustom];
    if (baseBtn) {
        baseBtn.type = type;
    }
    return baseBtn;
}

//重设image的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    if (self.currentImage) {
        if (_type == ADMChatButtonTypeRetry) {
            //实际应用中要根据情况，返回所需的frame
            return CGRectMake(12.5, 12.5, 15, 15);
        }
    }
    return [super imageRectForContentRect:contentRect];
}

@end
