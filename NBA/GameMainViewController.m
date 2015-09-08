//
//  GameMainViewController.m
//  NBA
//
//  Created by Andy on 2015/6/11.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "GameMainViewController.h"

@interface GameMainViewController ()

@end

@implementation GameMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewController];
    _scrollView.pagingEnabled = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 0)];
}

-(void)initViewController
{
    
    
//    self.gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
//    [self addChildViewController:_gameViewController];
//    [_gameViewController.view setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 1, -118, _scrollView.frame.size.width, _scrollView.frame.size.height)];
//    [self.scrollView addSubview:_gameViewController.view];
//    self.gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
//    [self addChildViewController:_gameViewController];
//    [_gameViewController.view setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 1, -118, _scrollView.frame.size.width, _scrollView.frame.size.height)];
//    [self.scrollView addSubview:_gameViewController.view];
    
    self.gamescoreViewController = [[GameScoreViewController alloc] initWithNibName:@"GameScoreViewController" bundle:nil];
    [self addChildViewController:_gamescoreViewController];
    [_gamescoreViewController.view setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 1, -118, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    [self.scrollView addSubview:_gamescoreViewController.view];
    
    self.gameAwayViewController = [[GameAwayViewController alloc] initWithNibName:@"GameAwayViewController" bundle:nil];
    [self addChildViewController:_gameAwayViewController];
    [_gameAwayViewController.view setFrame:CGRectMake(0, -118, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    [self.scrollView addSubview:_gameAwayViewController.view];
    
    self.gameHomeViewController = [[GameHomeViewController alloc] initWithNibName:@"GameHomeViewController" bundle:nil];
    [self addChildViewController:_gameHomeViewController];
    [_gameHomeViewController.view setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * 2, -118, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    [self.scrollView addSubview:_gameHomeViewController.view];
    
    
    _scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 1 , -118);
}

@end
