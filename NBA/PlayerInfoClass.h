//
//  PlayerInfoClass.h
//  NBA
//
//  Created by Andy on 2015/6/10.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerInfoClass : NSObject

@property (nonatomic, strong)NSString *playerName;
@property (nonatomic, strong)NSData *playerImg;
@property (nonatomic, strong)NSString *playerTeam;
@property (nonatomic, strong)NSString *playerPos;
@property (nonatomic, strong)NSString *playerHeight;
@property (nonatomic)int playerWeight;
@property (nonatomic)int playYears;

@end
