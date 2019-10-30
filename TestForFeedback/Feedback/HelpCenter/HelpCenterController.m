//
//  HelpCenterController.m
//  TestForFeedback
//
//  Created by Shane on 2019/9/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "HelpCenterController.h"

@interface HelpCenterController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *contentView;

@end

@implementation HelpCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentView.delegate = self;
    self.contentView.dataSource = self;
    [self.contentView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - <UITableViewDelegate && UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    return cell;
}

@end
