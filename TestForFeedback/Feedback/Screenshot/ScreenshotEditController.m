//
//  ScreenshotEditController.m
//  TestForFeedback
//
//  Created by Shane on 2019/9/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "ScreenshotEditController.h"
#import "FeedbackController.h"

#import "PaintView.h"

#import "UIView+ConvertToImage.h"

@interface ScreenshotEditController ()
@property (weak, nonatomic) IBOutlet UIImageView *screenshotImageView;
@property (weak, nonatomic) IBOutlet PaintView *paintView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *revokeButton;
@property (weak, nonatomic) IBOutlet UIButton *paintBrushButton;

@end

@implementation ScreenshotEditController
{
    UIImage *_screenshotImage;
}

- (instancetype)initWithScreenshotImage:(UIImage *)screenshotImage
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
    self.screenshotImageView.layer.cornerRadius = 4;
    self.screenshotImageView.layer.masksToBounds = YES;
    
    self.screenshotImageView.layer.borderColor = [UIColor colorNamed:@"lineColor"].CGColor;
    self.screenshotImageView.layer.borderWidth = 2;
    
    self.screenshotImageView.image = _screenshotImage;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(skipToFeedbackController)];
    
    [self.paintView setScreenshotImage:_screenshotImage];
}

#pragma mark - Action
- (void)skipToFeedbackController
{
    UIImage *image = [self.paintView convertViewToImage];
    FeedbackController *feedbackController = [[FeedbackController alloc] initWithScreenshot:image];
    [self.navigationController pushViewController:feedbackController animated:YES];
}
- (IBAction)revokeAction:(id)sender
{
    [self.paintView revoke];
}

#pragma mark -
- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}


@end
