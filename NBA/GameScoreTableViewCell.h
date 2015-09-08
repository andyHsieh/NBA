//
//  GameScoreTableViewCell.h
//  NBA
//
//  Created by Andy on 2015/6/14.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameScoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameMessageLabel;
@property (weak, nonatomic) IBOutlet UIView *homeView;
@property (weak, nonatomic) IBOutlet UIView *awayView;

@end
