//
//  SNHeightManager.h
//  systemLayoutSizeFittingSize_test
//
//  Created by stone on 16/7/10.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNHeightManager : NSObject
/** sectionHeight */
@property (nonatomic,assign) CGFloat sectionHeight;

/** cellHeights */
@property (nonatomic,strong) NSMutableArray<NSNumber *> * cellHeights;

@end
