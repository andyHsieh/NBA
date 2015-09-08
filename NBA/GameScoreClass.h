//
//  GameScoreClass.h
//  NBA
//
//  Created by Andy on 2015/6/14.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameScoreClass : NSObject
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *secondName;
@property (nonatomic, strong) NSString *incident;
@property (nonatomic) int value;
@property (nonatomic) int gameTime;
@property (nonatomic, strong) NSString *gameMessage;
@property (nonatomic) int awayPoint;
@property (nonatomic) int homePoint;
@property (nonatomic) BOOL team;
@end
