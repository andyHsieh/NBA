//
//  GameMainViewController.h
//  NBA
//
//  Created by Andy on 2015/6/11.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameScoreViewController.h"
#import "GameHomeViewController.h"
#import "GameAwayViewController.h"
@interface GameMainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) GameAwayViewController *gameAwayViewController;
@property (strong, nonatomic) GameHomeViewController *gameHomeViewController;
@property (strong, nonatomic) GameScoreViewController *gamescoreViewController;

@end
