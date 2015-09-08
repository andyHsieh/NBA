//
//  GameAwayViewController.m
//  NBA
//
//  Created by Andy on 2015/6/11.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "GameAwayViewController.h"
#import "GameResultTableViewCell.h"
#import "AppDelegate.h"
#import "ScoreClass.h"

@interface GameAwayViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate *appDelegate;
}
@end

@implementation GameAwayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _teamImg.image = [UIImage imageNamed:@"GoldenStateWarriors.jpg"];
    _gameAwayTableView.dataSource = self;
    _gameAwayTableView.delegate = self;
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"updateGame" object:nil];
    
}

-(void)receiveNotification:(NSNotification *)notification
{
    [_gameAwayTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [appDelegate.awayArray count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellGameAway = @"GameAwayCell";
    GameResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellGameAway];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"GameResultTableViewCell" bundle:nil] forCellReuseIdentifier:cellGameAway];
        cell = [tableView dequeueReusableCellWithIdentifier:cellGameAway];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ScoreClass *class = [appDelegate.awayArray objectAtIndex:indexPath.row];
    cell.playName.text = class.palyerName;
    cell.playerAssist.text = [NSString stringWithFormat:@"%d",class.assist];
    cell.playerBlock.text = [NSString stringWithFormat:@"%d", class.block];
    cell.playerFoul.text = [NSString stringWithFormat:@"%d", class.foul];
    cell.playerPoint.text = [NSString stringWithFormat:@"%d", class.point];
    cell.playerRebound.text = [NSString stringWithFormat:@"%d", class.rebounts];
    cell.playerSteal.text = [NSString stringWithFormat:@"%d", class.steal];
    cell.playerTurnover.text = [NSString stringWithFormat:@"%d", class.turnover];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

@end
