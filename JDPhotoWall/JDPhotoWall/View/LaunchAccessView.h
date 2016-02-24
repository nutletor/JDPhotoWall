//
//  LaunchAccessView.h
//  CJ
//
//  Created by HuangFei on 15/3/12.
//  Copyright (c) 2015年 weflytotti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LaunchAccessView : UIView

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIView *tapView;
@property (weak, nonatomic) IBOutlet UIImageView *tapImgView;

@property (weak, nonatomic) IBOutlet UIView *photoWallView;
@property (weak, nonatomic) IBOutlet UIView *logoView;

@property (nonatomic, assign) CGFloat lengthOfSide;
@property (nonatomic, assign) BOOL gender; // 0男，1女

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoView_height;

- (void)layoutPhotoWallWithGender:(BOOL)gender;

@end
