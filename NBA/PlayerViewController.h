//
//  PlayerViewController.h
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerInfoClass.h"
#import "DBModel.h"
#import "TeamClass.h"


@interface PlayerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *playerTableVIew;
@property (strong, nonatomic) PlayerInfoClass *playerInfoClass;
@property (strong, nonatomic) NSMutableArray *playerArray;
@property (strong, nonatomic) TeamClass *teamClass;
@property (nonatomic, strong) NSString *a;
@end
