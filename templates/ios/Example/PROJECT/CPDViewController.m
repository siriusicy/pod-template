//
//  CPDViewController.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "CPDViewController.h"

@interface CPDViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray<NSString *> *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CPDViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUI];
    
    self.dataArray =  @[@"UIViewController"];
    
    [self.tableView reloadData];

}

- (void)creatUI{
    
    self.tableView.frame = CGRectMake(0,
                                      0,
                                      [UIScreen mainScreen].bounds.size.width,
                                      [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:self.tableView];

}


#pragma mark -  TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];

    cell.textLabel.text = self.dataArray[indexPath.row];
    
    cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? [UIColor grayColor] : [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // TODO:- DoSomeThing
    UIViewController *vc = (UIViewController *)[[NSClassFromString(self.dataArray[indexPath.row]) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    //[self presentViewController:vc animated:YES completion:nil];
    
}

#pragma mark -  set/get

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = [UIColor clearColor];
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.01)];
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.01)];
        tableView.sectionHeaderHeight = 0.01;
        tableView.sectionFooterHeight = 0.01;
        
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        if (@available(iOS 15.0, *)) {
            tableView.sectionHeaderTopPadding = 0;
        }

        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];

        _tableView = tableView;
    }
    return _tableView;
}


@end
