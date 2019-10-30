//
//  ViewController.m
//  TestForFeedback
//
//  Created by Shane on 2019/9/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>

#import "ViewController.h"
#import "HelpCenterController.h"
#import "ScreenshotEditController.h"
#import "FeedbackController.h"

#import "ScreenshotUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:7];
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(100, 100, 200, 40);
    [self.view addSubview:label];
    
    label.text = @"123";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)showAlertController
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请问需要反馈什么问题？" message:@"你也可以在个人的反馈帮助中心里找到这个功能" preferredStyle:UIAlertControllerStyleAlert];
    
    __weak typeof(self) weakSelf = self;
    // 帮助中心
    UIAlertAction *helpAction = [UIAlertAction actionWithTitle:@"帮助中心" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf skipToHelpCenter];
    }];
    [alertController addAction:helpAction];
    // 快速反馈
    UIAlertAction *feedbackAction = [UIAlertAction actionWithTitle:@"快速反馈" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf skipToFeedback];
    }];
    [alertController addAction:feedbackAction];
    // 关闭摇一摇
    UIAlertAction *closeShakeAction = [UIAlertAction actionWithTitle:@"关闭摇一摇" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf closeShakeAction];
    }];
    [alertController addAction:closeShakeAction];
    // 没啥事，cancel
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"没啥事" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:NO completion:nil];
}

#pragma mark - Handle shake action
- (void)skipToHelpCenter
{
    // 跳转帮助中心
    HelpCenterController *helpCenterController = [[HelpCenterController alloc] init];
    [self.navigationController pushViewController:helpCenterController animated:YES];
}

- (void)skipToFeedback
{
    // 快速反馈
    UIImage *screenshotImage = [ScreenshotUtil getScreenshotWithView:self.view];
    ScreenshotEditController *screenshotEditController = [[ScreenshotEditController alloc] initWithScreenshotImage:screenshotImage];
    [self.navigationController pushViewController:screenshotEditController animated:YES];
}

- (void)closeShakeAction
{
    // 关闭摇一摇
    NSLog(@"是否关闭摇一摇");
}

#pragma mark - <MotionDelegate>
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"shake started");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"shake ended");
    [self showAlertController];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"shake cancelled");
}

@end
