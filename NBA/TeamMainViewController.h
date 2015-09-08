//
//  TeamsMainController.h
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamsInfoViewController.h"
#import "TeamClass.h"
#import "PlayerViewController.h"

@interface TeamMainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) TeamClass *teamClass;
@property (nonatomic, strong) TeamsInfoViewController *teamsInfoViewController;
@property (nonatomic, strong) PlayerViewController *playerViewController;
@property (nonatomic, strong) PlayerInfoClass *playerInfoClass;

@end
