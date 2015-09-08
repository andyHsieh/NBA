//
//  NewsMainViewController.m
//  NBA
//
//  Created by Andy on 2015/6/16.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "NewsMainViewController.h"
#import "MainViewController.h"



@interface NewsMainViewController ()

@end

@implementation NewsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:[_object objectForKey:@"imgUrl"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    _newsImg.image = [UIImage imageWithData:data];
    _newsTitle.text = [_object objectForKey:@"title"];
    _newsText.text = [_object objectForKey:@"context"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
