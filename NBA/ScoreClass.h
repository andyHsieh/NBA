//
//  ScoreClass.h
//  NBA
//
//  Created by Andy on 2015/6/20.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreClass : NSObject

@property (strong, nonatomic) NSString *palyerName;
@property (nonatomic) int point;
@property (nonatomic) int rebounts;
@property (nonatomic) int assist;
@property (nonatomic) int block;
@property (nonatomic) int steal;
@property (nonatomic) int turnover;
@property (nonatomic) int foul;

@end
