//
//  MainVIewControllerViewController.m
//  
//
//  Created by Andy on 2015/6/9.
//
//

#import "MainViewController.h"
#import <Parse/Parse.h>
#import "NewsTableViewCell.h"
#import "NewsMainViewController.h"
#import "NewsClass.h"
@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableData *receivedData;
    NSString *result;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _activity.hidesWhenStopped = YES;
    _newsTableView.dataSource = self;
    _newsTableView.delegate = self;
    _newsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_activity startAnimating];
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"News"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _newsArray = [[NSArray alloc] initWithArray:objects];
            [_newsTableView reloadData];
            [_activity stopAnimating];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_newsArray count];
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellNews = @"NewsCell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellNews];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:cellNews];
        cell = [tableView dequeueReusableCellWithIdentifier:cellNews];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    PFObject *object = [_newsArray objectAtIndex:indexPath.row];
    cell.newsTitle.text = [object objectForKey:@"title"];
    cell.newsImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[object objectForKey:@"imgUrl"]]]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsMainViewController *newsMainViewController = [[NewsMainViewController alloc] initWithNibName:@"NewsMainViewController" bundle:nil];
    PFObject *object = [_newsArray objectAtIndex:indexPath.row];
    newsMainViewController.object = object;
    
    [self.navigationController pushViewController:newsMainViewController animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}

@end
