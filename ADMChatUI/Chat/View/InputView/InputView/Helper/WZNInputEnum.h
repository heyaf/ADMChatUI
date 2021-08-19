//
//  WZNInputEnum.h
//  ADMKit
//
//  Created by WangKai on 2021/8/23.
//  Copyright © 2021 WangKai. All rights reserved.
//

#ifndef WZNInputEnum_h
#define WZNInputEnum_h

typedef enum : NSUInteger {
    //键盘状态
    ADMKeyboardTypeIdle = 0, //闲置状态
    ADMKeyboardTypeSystem,   //系统键盘
    ADMKeyboardTypeOther,    //自定义键盘
    //扩展键盘类型 - 按需求自行扩展
    ADMKeyboardTypeEmoticon, //表情键盘
    ADMKeyboardTypeMore,     //More键盘
} ADMKeyboardType;

typedef enum {
    ADMInputBtnTypeNormal = 0,   //系统默认类型
    ADMInputBtnTypeTool,         //键盘工具按钮
    ADMInputBtnTypeMore,         //More键盘按钮
} ADMInputBtnType;

typedef enum : NSInteger {
    ADMRecordTypeBegin = 0, //开始录音
    ADMRecordTypeCancel,    //取消录音
    ADMRecordTypeFinish,    //完成录音
} ADMRecordType;

typedef enum : NSInteger {
    WZInputMoreTypeImage = 0, //图片
    WZInputMoreTypeVideo,     //视频
    WZInputMoreTypeLocation,
    WZInputMoreTypeTransfer,
} WZInputMoreType;

#endif /* WZNInputEnum_h */
