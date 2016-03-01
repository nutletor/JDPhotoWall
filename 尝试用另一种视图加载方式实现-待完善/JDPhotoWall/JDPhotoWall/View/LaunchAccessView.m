//
//  LaunchAccessView.m
//  CJ
//
//  Created by HuangFei on 15/3/12.
//  Copyright (c) 2015年 weflytotti. All rights reserved.
//

#import "LaunchAccessView.h"
#import "FlipView.h"

#import "CJConfig.h"

//12张图片的tag值由341~352

@implementation LaunchAccessView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.frame = [UIScreen mainScreen].bounds;
//
    if (IS_IPHONE_4S) {
        self.frame = CGRectMake(0, 0, 321, 480);
        self.photoWallView.frame = CGRectMake(0, 0, 321, 428);
    }
    
    if (IS_IPHONE_5) {
        self.frame = CGRectMake(0, 0, 321, 568);
        self.photoWallView.frame = CGRectMake(0, 0, 321, 428);
    }
    
    if (IS_IPHONE_6) {
        self.photoWallView.frame = CGRectMake(0, 0, 375, 500);
    }
    
    if (IS_IPHONE_6_PLUS) {
        self.photoWallView.frame = CGRectMake(0, 0, 414, 552);
    }
    
//    NSString * visualFormat =[NSString stringWithFormat:@"V:[_logoView(==%.1f)]", self.frame.size.height - 1.5 * self.frame.size.width];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:NSDictionaryOfVariableBindings(_logoView)]];
    
    _logoView_height.constant = self.frame.size.height - 1.5 * self.frame.size.width;
    
    _lengthOfSide = self.frame.size.width / 3.0;
    
    self.tapView.hidden = NO;
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAndHide)];
    [self.tapView addGestureRecognizer:tapGesture];
    
    [self layoutPhotoWallWithGender:NO];
}

- (void)tapAndHide
{
    self.tapView.hidden = YES;
}

- (void)layoutPhotoWallWithGender:(BOOL)gender
{
    for(UIView *imgViews in [self.photoWallView subviews])
    {
        if ([imgViews isKindOfClass:[FlipView class]]) {
            [imgViews removeFromSuperview];
        }
    }
    for (int i = 0; i < 12; i++) {
        FlipView * flipView = [[[UINib nibWithNibName:@"FlipView" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
        flipView.frame = CGRectMake(i % 3 * _lengthOfSide, i / 3 * _lengthOfSide, _lengthOfSide, _lengthOfSide);
        flipView.imgView.tag = i + 341;
        
        if (gender) {
            [flipView.imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"boys_%d.jpg", i + 1]]];
        } else {
            [flipView.imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"girls_%d.jpg", i + 1]]];
        }
        [self.photoWallView addSubview:flipView];
    }
    [self.photoWallView bringSubviewToFront:self.tapView];
}

@end
