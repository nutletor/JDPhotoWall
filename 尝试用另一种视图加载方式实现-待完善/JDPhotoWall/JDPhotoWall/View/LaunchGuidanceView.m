//
//  LaunchGuidanceView.m
//  CJ
//
//  Created by HuangFei on 15/3/11.
//  Copyright (c) 2015年 weflytotti. All rights reserved.
//

#import "LaunchGuidanceView.h"
#import "TwinkleView.h"

#import "CJConfig.h"

//12张图片的tag值由311~322

@interface LaunchGuidanceView ()

@property (nonatomic, assign) BOOL gender; // 0男，1女
@property (weak, nonatomic) IBOutlet UIButton *boyBtn;
@property (weak, nonatomic) IBOutlet UIButton *girlBtn;

@property (weak, nonatomic) IBOutlet UIView *photoWallView;
@property (weak, nonatomic) IBOutlet UIView *logoView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoView_height;

@end

@implementation LaunchGuidanceView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.view = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.view];
        return self;
    }
    return nil;
}

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
    
//    self.view.frame = self.bounds;
//    self.frame = [UIScreen mainScreen].bounds;
//
//    if (IS_IPHONE_4S) {
//        self.frame = CGRectMake(0, 0, 321, 480);
//        self.photoWallView.frame = CGRectMake(0, 0, 321, 428);
//    }
//    
//    if (IS_IPHONE_5) {
//        self.frame = CGRectMake(0, 0, 321, 568);
//        self.photoWallView.frame = CGRectMake(0, 0, 321, 428);
//    }
//    
//    if (IS_IPHONE_6) {
//        self.photoWallView.frame = CGRectMake(0, 0, 375, 500);
//    }
//    
//    if (IS_IPHONE_6_PLUS) {
//        self.photoWallView.frame = CGRectMake(0, 0, 414, 552);
//    }
    
//    NSString * visualFormat =[NSString stringWithFormat:@"V:[_logoView(==%.1f)]", self.frame.size.height - 1.5 * self.frame.size.width];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:NSDictionaryOfVariableBindings(_logoView)]];
}

- (void)layoutSelfViews
{
    self.logoView_height.constant = self.view.frame.size.height - 1.5 * self.view.frame.size.width;
    
    [self layoutPhotoWallWithHeightOfIcon:(self.view.frame.size.width / 3.0)];
    
    [[NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(twinkleRandom) userInfo:nil repeats:YES] fire];
}

- (void)layoutPhotoWallWithHeightOfIcon:(CGFloat)height
{
    for (int i = 0; i < 12; i++) {
        TwinkleView * twinkleView = [[[UINib nibWithNibName:@"TwinkleView" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
        twinkleView.frame = CGRectMake(i % 3 * height, i / 3 * height, height, height);
        [self.photoWallView addSubview:twinkleView];
        
        twinkleView.tag = i + 311;
        twinkleView.imgView.contentMode = UIViewContentModeScaleToFill;
        [self loadIcons:twinkleView.imgView withIndex:i + 1];
    }
}

- (void)loadIcons:(UIImageView *)imgView withIndex:(int)index
{
    switch (index) {
        case 1:
        case 3:
        case 5:
        case 8:
        case 9:
        case 10:
        case 12:
            [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"girls_%d.jpg", index]]];
            break;
        default:
            [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"boys_%d.jpg", index]]];
            break;
    }
}

- (void)twinkleRandom
{
    int tag1 = arc4random() % 12 + 311;
    int tag2 = 0;
    int tag3 = 0;
    while (tag1 > 0) {
        tag2 = arc4random() % 12 + 311;
        if (tag2 != tag1) {
            break;
        }
    }
    while (tag2 > 0) {
        tag3 = arc4random() % 12 + 311;
        if (tag3 != tag1 && tag3 != tag2) {
            break;
        }
    }

    TwinkleView * twinkleView1 = (TwinkleView *)[self.photoWallView viewWithTag:tag1];
    [self twinkleAnimation:twinkleView1];
    
    TwinkleView * twinkleView2 = (TwinkleView *)[self.photoWallView viewWithTag:tag2];
    [self performSelector:@selector(twinkleAnimation:) withObject:twinkleView2 afterDelay:0.3];

    TwinkleView * twinkleView3 = (TwinkleView *)[self.photoWallView viewWithTag:tag3];
    [self performSelector:@selector(twinkleAnimation:) withObject:twinkleView3 afterDelay:0.5];
}

- (void)twinkleAnimation:(TwinkleView *)twinkleView
{
    [UIView animateWithDuration:1 animations:^{
        twinkleView.shadeView.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            twinkleView.shadeView.alpha = 0.8;
        }];
    }];
}

@end
