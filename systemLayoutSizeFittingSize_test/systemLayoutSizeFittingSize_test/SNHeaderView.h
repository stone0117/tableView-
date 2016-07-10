//
//  SNHeaderView.h
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNZhuxianModel.h"

@interface SNHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
/** headerModel */
@property (nonatomic,strong) SNMartial * martial;

@end
