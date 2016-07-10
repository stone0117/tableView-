//
//  SNZhuxianModel.h
//  systemLayoutSizeFittingSize_test
//
//  Created by stone on 16/7/10.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNMartial,SNDisciple;

@interface SNZhuxianModel : NSObject

+ (NSArray<SNMartial *> *)models;

@end

@interface SNMartial : NSObject

@property (nonatomic, copy) NSString *martialtitle;

@property (nonatomic, strong) NSArray<SNDisciple *> *disciples;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

@interface SNDisciple : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

