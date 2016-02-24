//
//  LaunchGuidanceView.h
//  CJ
//
//  Created by HuangFei on 15/3/11.
//  Copyright (c) 2015年 weflytotti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaunchGuidanceView : UIView

@property (nonatomic, assign) BOOL gender; // 0男，1女
@property (weak, nonatomic) IBOutlet UIButton *boyBtn;
@property (weak, nonatomic) IBOutlet UIButton *girlBtn;

@property (weak, nonatomic) IBOutlet UIView *photoWallView;
@property (weak, nonatomic) IBOutlet UIView *logoView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoView_height;

@end
