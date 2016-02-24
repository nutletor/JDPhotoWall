//
//  ViewController.m
//  JDPhotoWall
//
//  Created by THN-Huangfei on 16/2/23.
//  Copyright © 2016年 Huangfei. All rights reserved.
//

#import "ViewController.h"

#import "LaunchGuidanceView.h"
#import "LaunchAccessView.h"

@interface ViewController ()

@property(nonatomic, strong) LaunchGuidanceView *launchGuidanceView;
@property(nonatomic, strong) LaunchAccessView *launchAccessView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadLauchSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
- (void)loadLauchSubviews
{
    self.launchAccessView = [[[UINib nibWithNibName:@"LaunchAccessView" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
    [_launchAccessView.registerBtn addTarget:self action:@selector(backAroundBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_launchAccessView.loginBtn addTarget:self action:@selector(backAroundBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.launchGuidanceView = [[[UINib nibWithNibName:@"LaunchGuidanceView" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
    [_launchGuidanceView.boyBtn addTarget:self action:@selector(boyBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_launchGuidanceView.girlBtn addTarget:self action:@selector(girlBtnAction) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_launchAccessView];
    [self.view addSubview:_launchGuidanceView];
}

#pragma mark - Btn Action
- (void)boyBtnAction
{
    _launchAccessView.gender = NO;
    [_launchAccessView.tapImgView setImage:[UIImage imageNamed:@"tapImg_boy"]];
    [_launchAccessView layoutPhotoWallWithGender:NO];
    
    _launchAccessView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        _launchGuidanceView.alpha = 0;
    } completion:^(BOOL finished) {
        _launchGuidanceView.hidden = YES;
        _launchGuidanceView.alpha = 1;
        [self.view bringSubviewToFront:_launchAccessView];
    }];
}

- (void)girlBtnAction
{
    _launchAccessView.gender = YES;
    [_launchAccessView.tapImgView setImage:[UIImage imageNamed:@"tapImg_girl"]];
    [_launchAccessView layoutPhotoWallWithGender:YES];
    
    _launchAccessView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        _launchGuidanceView.alpha = 0;
    } completion:^(BOOL finished) {
        _launchGuidanceView.hidden = YES;
        _launchGuidanceView.alpha = 1;
        [self.view bringSubviewToFront:_launchAccessView];
    }];
}

- (void)backAroundBtnAction
{
    _launchGuidanceView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        _launchAccessView.alpha = 0;
    } completion:^(BOOL finished) {
        _launchAccessView.hidden = YES;
        _launchAccessView.alpha = 1;
        [self.view bringSubviewToFront:_launchGuidanceView];
    }];
}

@end
