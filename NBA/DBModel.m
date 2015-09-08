//
//  DBModel.m
//  Nba
//
//  Created by Andy on 2015/5/31.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "DBModel.h"
#import "TeamClass.h"
#import "NewsClass.h"
#import "GameScoreClass.h"



@implementation DBModel
-(instancetype)init
{
    self = [super init];
    if(self){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *documentDirectory = [paths objectAtIndex:0];
        NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"NBA.sqlite"];
        
        if(![[NSFileManager defaultManager] fileExistsAtPath:dbPath]){
            NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"NBA" ofType:@"sqlite"];
            [[NSFileManager defaultManager] copyItemAtPath:resourcePath toPath:dbPath error:nil];
        }

        _db = [FMDatabase databaseWithPath:dbPath];
        
        if (![_db open]) {
            NSLog(@"Could not open db");       
        }
    }
    return self;
}

-(NSMutableArray *)getTeamInfo:(NSString *)area
{

    FMResultSet *rs = [_db executeQuery:[NSString stringWithFormat:@"SELECT * from Teams Where area = '%@'", area]];
    NSMutableArray *teamArray = [[NSMutableArray alloc] init];
    while ([rs next]) {
        TeamClass *team = [[TeamClass alloc] init];
        team.name = [rs stringForColumn:@"Teams"];
        team.img = [rs dataForColumn:@"TeamsImg"];
        team.coach = [rs stringForColumn:@"CoachName"];
        team.win = [rs intForColumn:@"Win"];
        team.lose = [rs intForColumn:@"Lose"];
        [teamArray addObject:team];
    }
    [rs close];
    return teamArray;
}


-(TeamsInfoClass *)getTeamsInformationInfo:(NSString *)teamName{
    FMResultSet *rs = [_db executeQuery:[NSString stringWithFormat:@"SELECT * FROM Teams where Teams = '%@'",teamName]];
    TeamsInfoClass *teamsInfoClass = [[TeamsInfoClass alloc] init];
    while ([rs next]) {
        
        [teamsInfoClass.titleArray addObject:@"命中率"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f%%", [rs doubleForColumn:@"FG%"]]];

        [teamsInfoClass.titleArray addObject:@"3分球"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f%%", [rs doubleForColumn:@"3P%"]]];
        
        [teamsInfoClass.titleArray addObject:@"罰球"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f%%", [rs doubleForColumn:@"FT%"]]];
        
        [teamsInfoClass.titleArray addObject:@"進攻籃板"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f", [rs doubleForColumn:@"ORG"]]];
        
        [teamsInfoClass.titleArray addObject:@"防守籃板"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f",[rs doubleForColumn:@"DRG"]]];
        
        [teamsInfoClass.titleArray addObject:@"籃板總數"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f",[rs doubleForColumn:@"TRG"]]];
        
        [teamsInfoClass.titleArray addObject:@"助攻"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f",[rs doubleForColumn:@"APG"]]];
        
        [teamsInfoClass.titleArray addObject:@"抄截"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f",[rs doubleForColumn:@"SPG"]]];
        
        [teamsInfoClass.titleArray addObject:@"火鍋"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f",[rs doubleForColumn:@"BPG"]]];
        
        [teamsInfoClass.titleArray addObject:@"團隊失誤"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f",[rs doubleForColumn:@"TO"]]];
        
        [teamsInfoClass.titleArray addObject:@"團隊犯規"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f",[rs doubleForColumn:@"PF"]]];
        
        [teamsInfoClass.titleArray addObject:@"總得分"];
        [teamsInfoClass.valueArray addObject:[NSString stringWithFormat:@"%.1f",[rs doubleForColumn:@"PPG"]]];
    }
    [rs close];
    return teamsInfoClass;
}

-(NSMutableArray *)getPlayerInfo:(NSString *)playerTeam
{
    FMResultSet *rs = [_db executeQuery:[NSString stringWithFormat:@"SELECT * FROM Player where Teams = '%@'",playerTeam]];
    NSMutableArray *playerArray = [[NSMutableArray alloc] init];
    while ([rs next]) {
        PlayerInfoClass *playerInfoClass = [[PlayerInfoClass alloc] init];
        playerInfoClass.playerName = [rs stringForColumn:@"Name"];
        playerInfoClass.playerImg = [rs dataForColumn:@"PlayerImg"];
        playerInfoClass.playerPos  = [rs stringForColumn:@"POS"];
        playerInfoClass.playerTeam = [rs stringForColumn:@"Teams"];
        playerInfoClass.playerHeight = [rs stringForColumn:@"Height"];
        playerInfoClass.playerWeight = [rs intForColumn:@"Weight"];
        playerInfoClass.playYears = [rs intForColumn:@"Years"];
        [playerArray addObject:playerInfoClass];
    }
    [rs close];
    return playerArray;
}

-(NSMutableArray *)getGameScore:(int)time
{
    NSString *str =  [NSString stringWithFormat:@"SELECT * FROM Game where GameTime = %d", time];
    FMResultSet *rs = [_db executeQuery:str];
    NSMutableArray *gameArray = [[NSMutableArray alloc] init];
    while ([rs next]) {
        GameScoreClass *gameScoreClass = [[GameScoreClass alloc] init];
        gameScoreClass.firstName = [rs stringForColumn:@"FirstName"];
        gameScoreClass.secondName = [rs stringForColumn:@"SecondName"];
        gameScoreClass.incident = [rs stringForColumn:@"Incident"];
        gameScoreClass.value = [rs intForColumn:@"Value"];
        gameScoreClass.gameTime = [rs intForColumn:@"GameTime"];
        gameScoreClass.gameMessage = [rs stringForColumn:@"GameMessage"];
        gameScoreClass.awayPoint = [rs intForColumn:@"AwayPoint"];
        gameScoreClass.homePoint = [rs intForColumn:@"HomePoint"];
        gameScoreClass.team = [rs boolForColumn:@"Team"];
        [gameArray addObject:gameScoreClass];
        NSLog(@"%d", gameScoreClass.gameTime);
        NSLog(@"%@", gameScoreClass.gameMessage);
    }
    [rs close];
    return gameArray;
}

@end
