//
//  UITableView+HeightManager.m
//  systemLayoutSizeFittingSize_test
//
//  Created by stone on 16/7/10.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "UITableView+HeightManager.h"
#import <objc/runtime.h>
@implementation UITableView (HeightManager)
-(void)setCellHeight:(CGFloat)cellHeight{
    
    objc_setAssociatedObject(self, @selector(cellHeight), @(cellHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)cellHeight {
    
    NSNumber * number = objc_getAssociatedObject(self, _cmd);
    
    return number.floatValue;
}
//=========  ============================ stone 🐳 ===========/
-(UITableViewCell *)templateCell{
    
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setTemplateCell:(UITableViewCell *)templateCell{
    
    objc_setAssociatedObject(self, @selector(templateCell), templateCell, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
