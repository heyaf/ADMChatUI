//
//  ADMMoreKeyboard.h
//  ADMChat
//
//  Created by WangKai on 2018/9/5.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZNInputEnum.h"
@protocol ADMMoreKeyboardDelegate;

@interface ADMMoreKeyboard : UIView

@property (nonatomic, weak) id<ADMMoreKeyboardDelegate> delegate;

@end

@protocol ADMMoreKeyboardDelegate <NSObject>

@optional
- (void)moreKeyboard:(ADMMoreKeyboard *)moreKeyboard didSelectType:(WZInputMoreType)type;

@end
