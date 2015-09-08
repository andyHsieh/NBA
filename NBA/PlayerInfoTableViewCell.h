//
//  PlayerInfoTableViewCell.h
//  NBA
//
//  Created by Andy on 2015/6/10.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *playerImg;
@property (weak, nonatomic) IBOutlet UILabel *playerName;
@property (weak, nonatomic) IBOutlet UILabel *playerYears;

@property (weak, nonatomic) IBOutlet UILabel *playerPos;
@property (weak, nonatomic) IBOutlet UILabel *playerHeight;
@property (weak, nonatomic) IBOutlet UILabel *playerWeight;

@end
