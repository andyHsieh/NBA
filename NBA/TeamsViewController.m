//
//  TeamsViewController.m
//  
//
//  Created by Andy on 2015/6/9.
//
//

#import "TeamsViewController.h"
#import "DBModel.h"
#import "TeamClass.h"
#import "TeamsInfoViewController.h"
#import "TeamMainViewController.h"


@interface TeamsViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation TeamsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _teamsTableView.dataSource = self;
    _teamsTableView.delegate = self;
    [self initModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initModel{
    DBModel *model = [[DBModel alloc]init];
    self.eastArray = [model getTeamInfo:@"EASTERN"];
    self.westArray = [model getTeamInfo:@"WESTERN"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return [_eastArray count];
    }else{
        return [_westArray count];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellTeams = @"TeamsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellTeams];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellTeams];
    }
    TeamClass *team;
    if(indexPath.section == 0){
        team = [_eastArray objectAtIndex:indexPath.row];
    }else{
        team = [_westArray objectAtIndex:indexPath.row];
    }
    
    cell.imageView.image = [UIImage imageWithData:team.img];
    cell.textLabel.text = team.name;
//    cell.detailTextLabel.text =@"克理膚蘭騎士隊";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return @"東區";
    }else{
        return @"西區";
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TeamClass *team;
    if(indexPath.section == 0){
        team = [_eastArray objectAtIndex:indexPath.row];
    }else{
        team = [_westArray objectAtIndex:indexPath.row];
    }
    
    TeamMainViewController *teamMainViewController = [[TeamMainViewController alloc] initWithNibName:@"TeamMainViewController" bundle:nil];
    teamMainViewController.teamClass = team;
    [self.navigationController pushViewController:teamMainViewController animated:YES];
}

@end
