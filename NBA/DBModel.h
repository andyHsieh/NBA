//
//  DBModel.h
//  Nba
//
//  Created by Andy on 2015/5/31.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "TeamsInfoClass.h"
#import "PlayerInfoClass.h"
#import "GameScoreClass.h"
@interface DBModel : NSObject
@property (nonatomic, strong) FMDatabase *db;
-(NSMutableArray *)getTeamInfo:(NSString *)area;
-(NSMutableArray *)getNewsInfo;
-(TeamsInfoClass *)getTeamsInformationInfo:(NSString *)teamName;
-(NSMutableArray *)getPlayerInfo:(NSString *)playerTeam;
-(NSMutableArray *)getGameScore:(int)time;
@end;
