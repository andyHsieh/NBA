//
//  TeamsInfoViewController.m
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "TeamsInfoViewController.h"
#import "DBModel.h"

@interface TeamsInfoViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TeamsInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initModel];
    _teamInfoTableView.dataSource = self;
    _teamInfoTableView.delegate = self;
    _teamName.text = _teamClass.name;
    _teamCoach.text = _teamClass.coach;
    _teamVictory.text = [NSString stringWithFormat:@"%d勝 - %d敗", _teamClass.win, _teamClass.lose];
    _teamImg.image = [UIImage imageWithData:_teamClass.img];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initModel{
    DBModel *model = [[DBModel alloc] init];
    self.teamsInfoClass = [model getTeamsInformationInfo:_teamClass.name];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_teamsInfoClass.titleArray count];
}
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [_teamsInfoClass.titleArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_teamsInfoClass.valueArray objectAtIndex:indexPath.row];
    
    
    return cell;
}
@end
