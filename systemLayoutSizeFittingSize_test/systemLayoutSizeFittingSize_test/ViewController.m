//
//  ViewController.m
//  systemLayoutSizeFittingSize_test
//
//  Created by stone on 16/7/10.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNTableViewCell.h"
#import "ViewController.h"
#import "SNZhuxianModel.h"
#import "SNHeaderView.h"
#import "SNHeightManager.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

/** zhuxianmodels */
@property(nonatomic, strong) NSArray<SNMartial *> * zhuxianmodels;

/** heights */
@property(nonatomic, strong) NSMutableArray<SNHeightManager *> * managers;

/** View */
@property(strong, nonatomic) SNTableViewCell * cell;
/** View */
@property(strong, nonatomic) SNHeaderView * headerView;
@end

@implementation ViewController

/** managers 懒加载 */
- (NSMutableArray<SNHeightManager *> *)managers {
    if (_managers == nil) {
        _managers = [NSMutableArray array];
    }
    return _managers;
}
//===================================== stone ===========/

/** models 懒加载 */
- (NSArray<SNMartial *> *)zhuxianmodels {
    if (_zhuxianmodels == nil) {
        _zhuxianmodels = [SNZhuxianModel models];
    }
    return _zhuxianmodels;
}
//===================================== stone ===========/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect frame = self.view.bounds;
    UITableView * tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];

    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    tableView.delegate = self;
    tableView.dataSource = self;

    //    tableView.estimatedSectionHeaderHeight = 50;
    
    //    tableView.sectionHeaderHeight = 44;
    //    tableView.sectionFooterHeight = 0.001;
    
    [self.view addSubview:tableView];

    UINib * nib = [UINib nibWithNibName:@"SNTableViewCell" bundle:nil];

    [tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    UINib * headernib = [UINib nibWithNibName:@"SNHeaderView" bundle:nil];
    
    [tableView registerNib:headernib forHeaderFooterViewReuseIdentifier:@"headercell"];
}

#pragma mark - <UITableViewDataSource>
/** 组数 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.zhuxianmodels.count; //self.models.count;
}
/** 行数 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.zhuxianmodels[section].disciples.count;
}
/** cell */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SNTableViewCell * cell = [SNTableViewCell cellWithTableView:tableView];

    [self configureCell:cell atIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(SNTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row % 2) {
        cell.contentView.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:206 / 255.0 blue:166 / 255.0 alpha:1.0];
    } else {
        cell.contentView.backgroundColor = [UIColor colorWithRed:242 / 255.0 green:154 / 255.0 blue:76 / 255.0 alpha:1.0];
    }
    cell.disciple = self.zhuxianmodels[indexPath.section].disciples[indexPath.row];
}

#pragma mark - <UITableViewDelegate>

/** 自定义section header */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    SNHeaderView * headerView = [SNHeaderView headerViewWithTableView:tableView];
    
    headerView.contentLabel.text = self.zhuxianmodels[section].martialtitle;
    
    return headerView;
}

///* 动态计算cell高度 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    for (NSInteger sectiontemp = 0; sectiontemp <= indexPath.section; ++sectiontemp) {
        if (sectiontemp >= self.managers.count) {
            self.managers[sectiontemp] = [[SNHeightManager alloc] init];
        }
    }
    
    for (NSInteger rowtemp = 0; rowtemp <= indexPath.row; ++rowtemp) {
        if (rowtemp >= self.managers[indexPath.section].cellHeights.count) {

            self.managers[indexPath.section].cellHeights[rowtemp] = @(-1);
        }
    }
    
    if([self.managers[indexPath.section].cellHeights[indexPath.row] isEqualToNumber:@(-1)]){
        // 什么也不做 让代码往下走
    }else{
        return [self.managers[indexPath.section].cellHeights[indexPath.row] floatValue];
    }
    
    
    /** 如果想用 cell 不同样式 必须得 模型信息里 得有 样式信息 */
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    self.cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;

    [self configureCell:self.cell atIndexPath:indexPath];

    [self.cell prepareForReuse];

    CGFloat contentViewWidth = CGRectGetWidth(tableView.frame);

    //========= 核心代码 ============================ stone 🐳 ===========/
    NSLayoutConstraint * widthFenceConstraint = [NSLayoutConstraint constraintWithItem:self.cell.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:contentViewWidth];
    [self.cell.contentView addConstraint:widthFenceConstraint];
    CGSize fittingSize = [self.cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    [self.cell.contentView removeConstraint:widthFenceConstraint];
    //=========  ============================ stone 🐳 ===========/
    
    self.managers[indexPath.section].cellHeights[indexPath.row] = @(fittingSize.height);
    
    //=========  ============================ stone 🐳 ===========/
    
    return fittingSize.height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    for (NSInteger sectiontemp = 0; sectiontemp <= section; ++sectiontemp) {
        if (sectiontemp >= self.managers.count) {
            self.managers[sectiontemp] = [[SNHeightManager alloc] init];
        }
    }
    
    if (self.managers[section].sectionHeight == 0) {
        // 什么也不做 让代码 往下走
    }else{
        NSLog(@"命中了吗");
        return self.managers[section].sectionHeight;
    }
    
    
    self.headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headercell"];

    self.headerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.headerView.contentLabel.text = self.zhuxianmodels[section].martialtitle;
    
    [self.headerView prepareForReuse];
    
    CGFloat contentViewWidth = CGRectGetWidth(tableView.frame);
    //========= 核心代码 ============================ stone 🐳 ===========/
    NSLayoutConstraint * widthFenceConstraint = [NSLayoutConstraint constraintWithItem:self.headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:contentViewWidth];
   
    [self.headerView addConstraint:widthFenceConstraint];
    
    CGSize fittingSize = [self.headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    [self.headerView removeConstraint:widthFenceConstraint];
    //=========  ============================ stone 🐳 ===========/
    
    self.managers[section].sectionHeight = fittingSize.height;
    //=========  ============================ stone 🐳 ===========/
    
    return fittingSize.height;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.managers removeAllObjects];
    [tableView reloadData];
}
@end
