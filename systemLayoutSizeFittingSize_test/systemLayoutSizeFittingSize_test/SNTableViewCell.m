//
//  SNTableViewCell.m
//  test_cell_height
//
//  Created by stone on 16/7/6.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNTableViewCell.h"

@interface SNTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@end
@implementation SNTableViewCell

-(void)setDisciple:(SNDisciple *)disciple{
    _disciple = disciple;
    // 设置数据
    self.iconView.image = [UIImage imageNamed:disciple.icon];
    self.nameLabel.text = disciple.name;
    self.introLabel.text = disciple.intro;
}
//-(void)awakeFromNib{
//    self.introLabel.preferredMaxLayoutWidth = self.bounds.size.width - 8 - 80 - 8 - 8;
//}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"cell";
    
    SNTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
}

@end
