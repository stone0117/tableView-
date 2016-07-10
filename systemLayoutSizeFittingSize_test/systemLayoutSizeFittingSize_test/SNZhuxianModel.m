//
//  SNZhuxianModel.m
//  systemLayoutSizeFittingSize_test
//
//  Created by stone on 16/7/10.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "SNZhuxianModel.h"

@implementation SNZhuxianModel

+ (NSArray<SNMartial *> *)models {
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"zhuxian.plist" ofType:nil];
    NSArray * arr = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray * arrM = [NSMutableArray arrayWithCapacity:arr.count];
    
    [arr enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL * _Nonnull stop) {
        SNMartial * model = [[SNMartial alloc] initWithDict:dict];
        [arrM addObject:model];
    }];
    return arrM.copy;
}
@end

@implementation SNMartial

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:@"disciples"]) {

        NSMutableArray * arrM = [NSMutableArray array];
        [value enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
          [arrM addObject:[[SNDisciple alloc] initWithDict:obj]];
        }];

        self.disciples = arrM.copy;

        return;
    }

    [super setValue:value forKey:key];
}

@end

@implementation SNDisciple

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
