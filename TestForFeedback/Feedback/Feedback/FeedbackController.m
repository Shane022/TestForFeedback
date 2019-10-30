//
//  FeedbackController.m
//  TestForFeedback
//
//  Created by Shane on 2019/9/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "FeedbackController.h"

@interface FeedbackController ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UILabel *screenshotLabel;
@property (weak, nonatomic) IBOutlet UIImageView *screenshotImageView;

@end

@implementation FeedbackController
{
    UIImage *_screenshotImage;
}

- (instancetype)initWithScreenshot:(UIImage *)screenshotImage
{
    self = [super init];
    if (self) {
        _screenshotImage = screenshotImage;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

- (void)setupSubviews
{
    self.screenshotImageView.image = _screenshotImage;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)hideKeyboard:(UITapGestureRecognizer *)tapGesture
{
    if ([tapGesture.view isKindOfClass:[UITextView class]]) {
        return;
    }
    
    [self.view endEditing:YES];
}

#pragma mark -
- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

@end
