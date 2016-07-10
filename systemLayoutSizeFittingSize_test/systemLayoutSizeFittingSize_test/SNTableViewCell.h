//
//  SNTableViewCell.h
//  test_cell_height
//
//  Created by stone on 16/7/6.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNZhuxianModel.h"
@interface SNTableViewCell : UITableViewCell

/** 模型数据 */
@property (nonatomic, strong) SNDisciple * disciple;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
