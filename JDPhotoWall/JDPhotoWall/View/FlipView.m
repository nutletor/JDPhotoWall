//
//  FlipView.m
//  CJ
//
//  Created by HuangFei on 15/3/17.
//  Copyright (c) 2015年 weflytotti. All rights reserved.
//

#import "FlipView.h"
#import <AudioToolbox/AudioToolbox.h>

static SystemSoundID shake_sound_male_id = 0;
@implementation FlipView

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
    
    self.imgView.frame = self.bounds;
    self.imgView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipImg:)];
    [self.imgView addGestureRecognizer:tapGesture];
}

- (void)flipImg:(UITapGestureRecognizer *)tap
{
    UIImageView * secondImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"waiting4U_%ld.jpg", tap.view.tag - 340]]];
    secondImgView.frame = tap.view.frame;
    
    [self flipAnimationWithView1:_imgView view2:secondImgView];
    
    NSInteger index = tap.view.tag - 340;
    [self playSoundWithIndex:index];
}

- (void)flipAnimationWithView1:(UIImageView *)view1 view2:(UIImageView *)view2
{
    [UIView transitionFromView:view1 toView:view2 duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft + UIViewAnimationOptionCurveEaseInOut completion:^(BOOL finished) { }];
}

- (void)playSoundWithIndex:(NSInteger)index
{
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"flip_%ld", (long)index] ofType:@"wav"];
    if (path) {
        //注册声音到系统
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &shake_sound_male_id);
        AudioServicesPlaySystemSound(shake_sound_male_id);
    }
}

@end
