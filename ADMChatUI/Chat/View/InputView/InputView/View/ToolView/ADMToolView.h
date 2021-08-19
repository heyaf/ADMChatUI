//
//  ADMToolView.h
//  ADMKit_Example
//
//  Created by WangKai on 2021/8/22.
//  Copyright © 2021 WangKai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZNInputEnum.h"
@protocol ADMToolViewDelegate;

@interface ADMToolView : UIView

@property (nonatomic, weak) id<ADMToolViewDelegate> delegate;

///还原btn状态
- (void)resetStatus;

@end

@protocol ADMToolViewDelegate <NSObject>

@optional
- (void)toolView:(ADMToolView *)toolView didSelectAtIndex:(NSInteger)index;
- (void)toolView:(ADMToolView *)toolView showKeyboardType:(ADMKeyboardType)type;
- (void)toolView:(ADMToolView *)toolView didChangeRecordType:(ADMRecordType)type;

@end
