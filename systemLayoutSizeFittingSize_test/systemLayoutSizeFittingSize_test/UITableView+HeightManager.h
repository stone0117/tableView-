//
//  UITableView+HeightManager.h
//  systemLayoutSizeFittingSize_test
//
//  Created by stone on 16/7/10.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (HeightManager)
/** height */
@property (nonatomic, assign) CGFloat cellHeight;

/** templateCell */
@property (nonatomic,strong) UITableViewCell * templateCell;

@end
