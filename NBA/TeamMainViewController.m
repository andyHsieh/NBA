//
//  TeamsMainController.m
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "TeamMainViewController.h"

@interface TeamMainViewController ()

@end

@implementation TeamMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewController];
    
//    [self scrollViewDidEndDecelerating];
    

    _scrollView.pagingEnabled = YES;
    
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"球隊資訊",@"球員資訊", nil]];
    control.selectedSegmentIndex = 0;
    self.navigationItem.titleView = control;
    [control addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)valueChanged:(UISegmentedControl *)segment
{

    if (segment.selectedSegmentIndex == 0) {
        
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width *0, -64) animated:YES];
        
    }else{
        
        [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width *1, -64) animated:YES];
        
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 0)];
}



-(void)initViewController
{
    
    self.teamsInfoViewController = [[TeamsInfoViewController alloc] initWithNibName:@"TeamsInfoViewController" bundle:nil];
    _teamsInfoViewController.teamClass = self.teamClass;
    [self addChildViewController:_teamsInfoViewController];
    [_teamsInfoViewController.view setFrame:CGRectMake(0, -118, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    [self.scrollView addSubview:_teamsInfoViewController.view];
   
    
    self.playerViewController = [[PlayerViewController alloc] initWithNibName:@"PlayerViewController" bundle:nil];
    _playerViewController.teamClass = self.teamClass;
    _playerViewController.playerInfoClass = self.playerInfoClass;
    [self addChildViewController:_playerViewController];
    [_playerViewController.view setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 1, -118, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    [self.scrollView addSubview:_playerViewController.view];
    
    
    
}



//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    if (self.scrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width) {
//        [self.sesegmentedControl setSelectedSegmentIndex:1 animated:YES];
//    }else{
//        [self.segmentedControl setSelectedSegmentIndex:0 animated:YES];
//    }
//}

@end
