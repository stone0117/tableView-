//
//  SNHeaderView.m
//  EasywayTableView
//
//  Created by stone on 16/6/22.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNHeaderView.h"
@interface SNHeaderView()



@end
@implementation SNHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    
    static NSString * ID = @"headercell";
    
    SNHeaderView * headercell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    return headercell;
}
- (void)setMartial:(SNMartial *)martial{
    _martial = martial;
    
    self.contentLabel.text = martial.martialtitle;
    
    NSLog(@"%@",    self.contentLabel.text);
    
    
}
@end
