//
//  TeamsInfoViewController.h
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamClass.h"
#import "TeamsInfoClass.h"

@interface TeamsInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *teamImg;
@property (weak, nonatomic) IBOutlet UILabel *teamName;
@property (weak, nonatomic) IBOutlet UILabel *teamCoach;
@property (weak, nonatomic) IBOutlet UILabel *teamVictory;
@property (weak, nonatomic) IBOutlet UITableView *teamInfoTableView;
@property (nonatomic, strong) TeamClass *teamClass;
@property (nonatomic, strong) TeamsInfoClass *teamsInfoClass;

@end
