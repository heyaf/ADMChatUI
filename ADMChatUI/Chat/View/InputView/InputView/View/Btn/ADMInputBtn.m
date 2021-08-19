//
//  ADMInputBtn.m
//  ADMChat
//
//  Created by WangKai on 2018/9/4.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import "ADMInputBtn.h"

@interface ADMInputBtn ()

@property (nonatomic, assign) ADMInputBtnType type;

@end

@implementation ADMInputBtn

+ (instancetype)chatButtonWithType:(ADMInputBtnType)type{
    ADMInputBtn *baseBtn = [super buttonWithType:UIButtonTypeCustom];
    if (baseBtn) {
        baseBtn.type = type;
    }
    return baseBtn;
}

//重设image的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    if (self.currentImage) {
        if (_type == ADMInputBtnTypeTool) {
            //实际应用中要根据情况，返回所需的frame
            return CGRectMake(5, 5, 30, 30);
        }
        if (_type == ADMInputBtnTypeMore) {
            //实际应用中要根据情况，返回所需的frame
            return CGRectMake(10, 15, 40, 40);
        }
    }
    return [super imageRectForContentRect:contentRect];
}

//重设title的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    if (_type == ADMInputBtnTypeMore) {
        //实际应用中要根据情况，返回所需的frame
        return CGRectMake(0, 55, 60, 25);
    }
    return [super titleRectForContentRect:contentRect];
}

@end
