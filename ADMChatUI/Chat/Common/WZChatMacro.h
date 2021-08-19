//
//  WZChatMacro.h
//  ADMChat
//
//  Created by WangKai on 2021/8/20.
//  Copyright © 2021 WangKai. All rights reserved.
//

#ifndef WZChatMacro_h
#define WZChatMacro_h

#import "ADMInputHelper.h"
#define CHAT_SCREEN_WIDTH  [[ADMInputHelper helper] screenW]
#define CHAT_SCREEN_HEIGHT [[ADMInputHelper helper] screenH]

#define CHAT_IPHONEX   [[ADMInputHelper helper] iPhoneX]
#define CHAT_NAV_BAR_H [[ADMInputHelper helper] navBarH]
#define CHAT_TAB_BAR_H [[ADMInputHelper helper] tabBarH]
#define CHAT_BOTTOM_H  [[ADMInputHelper helper] iPhoneXBottomH]

//默认图
#define CHAT_BAD_IMAGE [ADMInputHelper otherImageNamed:@"ADM_chat_default"]

#endif /* LLMacro_h */
