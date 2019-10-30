//
//  PaintView.m
//  TestForFeedback
//
//  Created by Shane on 2019/9/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "PaintView.h"


@implementation PaintView
{
    CAShapeLayer *_shapeLayer;
    CGMutablePathRef _path;
    NSMutableArray *_pathArray;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupSubviewsAndInitData];
}

- (void)setupSubviewsAndInitData
{
    _pathArray = [NSMutableArray arrayWithCapacity:0];
}

- (void)setScreenshotImage:(UIImage *)screenshotImage
{
    self.layer.contents = (id)screenshotImage.CGImage;
}

#pragma mark - Touch event
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    
    _path = CGPathCreateMutable();
    CGPathMoveToPoint(_path, NULL, p.x, p.y);
    
    CAShapeLayer * slayer = [CAShapeLayer layer];
    slayer.path = _path;
    slayer.lineWidth = 2;
    slayer.fillColor = [UIColor clearColor].CGColor;
    slayer.strokeColor = [UIColor redColor].CGColor;
    // 略：设置 slyer 参数
    [self.layer addSublayer:slayer];
    _shapeLayer = slayer;
    
    [_pathArray addObject:slayer];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    //略：point有效值判断
    if ([self.layer containsPoint:p]) {
//        NSLog(@"yes");
    } else {
//        NSLog(@"no");
    }
    //点加至线上
    CGPathAddLineToPoint(_path, NULL, p.x, p.y);
    _shapeLayer.path = _path;
}

- (void)revoke
{
    [_pathArray.lastObject removeFromSuperlayer];
    [_pathArray removeLastObject];
}

@end
