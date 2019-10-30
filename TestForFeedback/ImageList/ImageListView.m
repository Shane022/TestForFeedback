//
//  ImageListView.m
//  TestForFeedback
//
//  Created by Shane on 2019/9/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "ImageListView.h"

#import "ImageCell.h"

@interface ImageListView ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *contentView;

@end

@implementation ImageListView


#pragma mark - Lazy load
- (UICollectionView *)contentView
{
    if (!_contentView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _contentView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _contentView.delegate = self;
        _contentView.dataSource = self;
        [_contentView registerNib:[UINib nibWithNibName:NSStringFromClass([ImageCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([ImageCell class])];
    }
    
    return _contentView;
}

@end
