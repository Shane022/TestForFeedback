//
//  PaintView.h
//  TestForFeedback
//
//  Created by Shane on 2019/9/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaintView : UIView

@property (nonatomic, strong) UIImage *screenshotImage;

- (void)revoke;

@end

NS_ASSUME_NONNULL_END
