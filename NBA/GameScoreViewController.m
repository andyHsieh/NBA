//
//  GameScoreViewController.m
//  NBA
//
//  Created by Andy on 2015/6/11.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "GameScoreViewController.h"
#import "DBModel.h"
#import "GameScoreTableViewCell.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface GameScoreViewController ()<UITableViewDataSource,
UITableViewDelegate>
{
    NSInteger count;
    int startTime;
    int endTime;
    DBModel *model;
    NSTimer *timer;
    AppDelegate *appDelegate;
    NSMutableArray *gameArray;
}
@end

@implementation GameScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    model = [[DBModel alloc] init];
    _gameScoreTableView.dataSource = self;
    _gameScoreTableView.delegate = self;
    _homeImg.image = [UIImage imageNamed:@"ClevelandCavaliers.jpg"];
    _awayImg.image = [UIImage imageNamed:@"GoldenStateWarriors.jpg"];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"updateGame" object:nil];
    gameArray = appDelegate.gameArray;
    
    
}

-(void)receiveNotification:(NSNotification *)notification
{
    NSLog(@"reload");
    [_gameScoreTableView reloadData];
    PFObject *objectGame = [gameArray objectAtIndex:0];
    _timeLabel.text = [self getTime:[[objectGame objectForKey:@"GameTime"]intValue]];
    //int awayPoint = [[objectGame objectForKey:@"AwayPoint"]intValue];
    //int homePoint = [[objectGame objectForKey:@"HomePoint"]intValue];
    _scoreLabel.text = [NSString stringWithFormat:@"%d : %d",[[objectGame objectForKey:@"AwayPoint"]intValue],[[objectGame objectForKey:@"HomePoint"]intValue]];
    [_gameScoreTableView setContentOffset:CGPointMake(0, 0) animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [gameArray count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellGame = @"GameCell";
    GameScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellGame];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"GameScoreTableViewCell" bundle:nil] forCellReuseIdentifier:cellGame];
        cell = [tableView dequeueReusableCellWithIdentifier:cellGame];
    }
    PFObject *object = [gameArray objectAtIndex:indexPath.row];
    cell.gameMessageLabel.text = [object objectForKey:@"GameMessage"];
    cell.timeScoreLabel.text = [self getTime:[[object objectForKey:@"GameTime"]intValue]];
    
    if([[object objectForKey:@"Team"]boolValue]){
        cell.awayView.hidden = YES;
        cell.homeView.hidden = NO;
    }else{
        cell.homeView.hidden = YES;
        cell.awayView.hidden = NO;
    }
    
    return cell;
}

-(IBAction)firstGameButton:(id)sender
{
    gameArray = appDelegate.gameFirstArray;
    [_gameScoreTableView reloadData];
    
}
-(IBAction)secondGameButton:(id)sender
{
    gameArray = appDelegate.gameSecondArray;
    [_gameScoreTableView reloadData];
}
-(IBAction)thirdGameButton:(id)sender
{
    gameArray = appDelegate.gameThirdArray;
    [_gameScoreTableView reloadData];
}
-(IBAction)fourthGameButton:(id)sender
{
    gameArray = appDelegate.gameArray;
    [_gameScoreTableView reloadData];
}
-(IBAction)allGameButton:(id)sender
{
    gameArray = appDelegate.allGameArray;
    [_gameScoreTableView reloadData];
}

-(NSString *)getTime:(int)gameTime
{
    int sec;
    int min;
    min = (720 - gameTime) / 60;
    sec = (720 - gameTime) % 60;
    return [NSString stringWithFormat:@"%d分%d秒", min, sec];
}
@end
