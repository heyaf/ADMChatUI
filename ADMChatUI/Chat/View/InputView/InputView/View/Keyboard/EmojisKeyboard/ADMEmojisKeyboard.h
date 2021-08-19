//
//  ADMEmojisKeyboard.h
//  ADMChat
//
//  Created by WangKai on 2018/9/5.
//  Copyright © 2018年 WangKai. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ADMEmojisKeyboardDelegate;

@interface ADMEmojisKeyboard : UIView

@property (nonatomic, weak) id<ADMEmojisKeyboardDelegate> delegate;

@end

@protocol ADMEmojisKeyboardDelegate <NSObject>

@optional
- (void)emojisKeyboardDidSelectSend:(ADMEmojisKeyboard *)emojisKeyboard;
- (void)emojisKeyboardDidSelectDelete:(ADMEmojisKeyboard *)emojisKeyboard;
- (void)emojisKeyboard:(ADMEmojisKeyboard *)emojisKeyboard didSelectText:(NSString *)text;

@end
