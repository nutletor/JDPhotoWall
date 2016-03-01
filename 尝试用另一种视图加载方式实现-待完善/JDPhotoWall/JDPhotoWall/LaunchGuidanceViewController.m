//
//  LaunchGuidanceViewController.m
//  JDPhotoWall
//
//  Created by THN-Huangfei on 16/2/23.
//  Copyright © 2016年 Huangfei. All rights reserved.
//

#import "LaunchGuidanceViewController.h"

#import "LaunchGuidanceView.h"

@interface LaunchGuidanceViewController ()

@property (weak, nonatomic) IBOutlet LaunchGuidanceView *guidanceView;

@end

@implementation LaunchGuidanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self layoutGuidanceView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)layoutGuidanceView
{
    self.guidanceView.view.frame = self.guidanceView.bounds;
    [self.guidanceView layoutSelfViews];
}

@end
