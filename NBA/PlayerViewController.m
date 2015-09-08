//
//  PlayerViewController.m
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "PlayerViewController.h"
#import "PlayerInfoTableViewCell.h"



@interface PlayerViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSString *a;
}
@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initModel];
    _playerTableVIew.dataSource = self;
    _playerTableVIew.delegate = self;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initModel
{
    DBModel *model = [[DBModel alloc] init];
    self.playerArray = [model getPlayerInfo:_teamClass.name];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_playerArray count];
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellPlayer = @"PlayerCell";
    PlayerInfoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellPlayer];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"PlayerInfoTableViewCell" bundle:nil] forCellReuseIdentifier:cellPlayer];
        cell = [tableView dequeueReusableCellWithIdentifier:cellPlayer];
    }
    PlayerInfoClass *playerInfoClass;
    playerInfoClass = [_playerArray objectAtIndex:indexPath.row];
//    NSString *a = @"fsdadf";
//    cell.playerTeam.text = a;
    cell.playerName.text = playerInfoClass.playerName;
    cell.playerImg.image = [UIImage imageWithData:playerInfoClass.playerImg];
    cell.playerPos.text = playerInfoClass.playerPos;
    cell.playerHeight.text = playerInfoClass.playerHeight;
    cell.playerWeight.text = [NSString stringWithFormat:@"%d磅",playerInfoClass.playerWeight];
    cell.playerYears.text = [NSString stringWithFormat:@"%d年",playerInfoClass.playYears];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


@end
