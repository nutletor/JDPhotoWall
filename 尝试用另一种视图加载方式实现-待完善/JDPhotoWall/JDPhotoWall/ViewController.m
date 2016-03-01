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

#import "LaunchAccessViewController.h"
#import "LaunchGuidanceViewController.h"

@interface ViewController ()

//@property(nonatomic, strong) LaunchGuidanceView *launchGuidanceView;
//@property(nonatomic, strong) LaunchAccessView *launchAccessView;

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
//    self.launchAccessView = [[[UINib nibWithNibName:@"LaunchAccessView" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
//    _launchAccessView.hidden = YES;
//    
//    self.launchGuidanceView = [[[UINib nibWithNibName:@"LaunchGuidanceView" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
//    _launchGuidanceView.hidden = YES;
//    [_launchGuidanceView.boyBtn addTarget:self action:@selector(boyBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    [_launchGuidanceView.girlBtn addTarget:self action:@selector(girlBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:_launchAccessView];
//    [self.view sendSubviewToBack:_launchAccessView];
//    
//    [self.view addSubview:_launchGuidanceView];
    
    LaunchGuidanceViewController * guidanceVC = [[LaunchGuidanceViewController alloc] initWithNibName:@"LaunchGuidanceViewController" bundle:nil];
    [self.view addSubview:guidanceVC.view];
    
//    LaunchAccessViewController * accessVC = [[LaunchAccessViewController alloc] initWithNibName:@"LaunchAccessViewController" bundle:nil];
//    [self.view addSubview:accessVC.view];
}

#pragma mark - Action
- (void)boyBtnAction
{
//    _launchAccessView.gender = NO;
//    [_launchAccessView.tapImgView setImage:[UIImage imageNamed:@"tapImg_boy"]];
//    [_launchAccessView layoutPhotoWallWithGender:NO];
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        _launchGuidanceView.alpha = 0;
//    } completion:^(BOOL finished) {
//        _launchGuidanceView.hidden = YES;
//        _launchGuidanceView.alpha = 1;
//    }];
}

- (void)girlBtnAction
{
//    _launchAccessView.gender = YES;
//    [_launchAccessView.tapImgView setImage:[UIImage imageNamed:@"tapImg_girl"]];
//    [_launchAccessView layoutPhotoWallWithGender:YES];
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        _launchGuidanceView.alpha = 0;
//    } completion:^(BOOL finished) {
//        _launchGuidanceView.hidden = YES;
//        _launchGuidanceView.alpha = 1;
//    }];
}

@end
