//
//  GameResultTableViewCell.h
//  NBA
//
//  Created by Andy on 2015/6/15.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *playName;
@property (weak, nonatomic) IBOutlet UILabel *playerPoint;
@property (weak, nonatomic) IBOutlet UILabel *playerRebound;
@property (weak, nonatomic) IBOutlet UILabel *playerAssist;
@property (weak, nonatomic) IBOutlet UILabel *playerBlock;
@property (weak, nonatomic) IBOutlet UILabel *playerSteal;
@property (weak, nonatomic) IBOutlet UILabel *playerTurnover;
@property (weak, nonatomic) IBOutlet UILabel *playerFoul;

@end
