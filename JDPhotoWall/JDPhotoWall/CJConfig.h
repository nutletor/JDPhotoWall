//
//  CJConfig.h
//  CJ
//
//  Created by weflytotti on 14/9/25.
//  Copyright (c) 2014年 weflytotti. All rights reserved.
//

#ifndef CJ_CJConfig_h
#define CJ_CJConfig_h

/************************************************************************************
 *
 * 项目发布宏配置定义-----》BEGIN
 *
 **************************************************************************************/


#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4S (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
//#define IS_IPHONE_6PLUS (IS_IPHONE && [[UIScreen mainScreen] nativeScale] == 3.0f)
//#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)

#define IS_IPHONE_6_PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

//iphone 6 plus 标准模式
#define IS_IPHONE_6_PLUS_NORMAL ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define  IS_IPHONE_6_PLUS_BIG ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?  CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)

#define IS_DEVICE8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)



#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define BundleIdentifier @"com.chujian.im"

#define CJLaunchModule @"CJLaunchModule"

#define CJPushToken    @"CJPushToken"

#define RegisInit      @"CJRegisInit"

#define yyyyMmDDkey   @"yyyy-MM-dd"
#define yyyyMmDdHhMmSsKey @"yyyy-MM-dd HH:mm:ss"

#define USER_GRAVATAR_MAX_WIDTH (640)

#define  PHONETAG     (10001)
#define  PASSWORDTAG     (10002)
#define  AUTHCODETAG     (10003)

#define CommonFontName @"STHeitiSC-Light"
#define CommonFontBoldName @"STHeitiTC-Medium"

// 注册登录错误提示背景色
#define ErrorTipBgColor (0xF78CA7)
// 注册登录验证码按钮是否可发送状态颜色
#define AuthCodeCannotSend (0x999999)
#define AuthCodeCanSend (0x326772)


//标题字体
#define TitleCommonFontSize  (18)
#define TitleCommonFontColor (0xa0a0a0)

//提示内容
#define InfoCommonFontSize  (14)

//标签
#define TagCommonFontSize    (12)

#define SubTitleFontSize   (16)



#define UIImagePickerControllerDismissedCallContinue   @"UIImagePickerControllerDismissedCallContinue"

#define IMIPServerNotification  @"IMIPServerNotification"
#define UserLoginAnotherPlace   @"UserLoginAnotherPlace"

#define VersionChecked          @"VersionChecked"

//#define PwdErrorDes   @"密码长度不少于6位,只能够包含字母A到Z,数字,下划线"
#define PwdErrorDes   @"密码长度为6~16位"

#endif
