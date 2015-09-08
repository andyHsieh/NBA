//
//  GameScoreViewController.h
//  NBA
//
//  Created by Andy on 2015/6/11.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameScoreClass.h"
#import "TeamClass.h"

@interface GameScoreViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *awayImg;
@property (weak, nonatomic) IBOutlet UIImageView *homeImg;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UITableView *gameScoreTableView;
@property (strong, nonatomic) NSMutableArray *modelArray;
@property (strong, nonatomic) TeamClass *teamclass;




@end
