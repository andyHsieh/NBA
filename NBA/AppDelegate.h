//
//  AppDelegate.h
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreClass.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    int gameTime;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSMutableArray *gameArray;
@property (nonatomic, strong) NSMutableArray *awayArray;
@property (nonatomic, strong) NSMutableArray *homeArray;
@property (nonatomic, strong) NSMutableArray *gameFirstArray;
@property (nonatomic, strong) NSMutableArray *gameSecondArray;
@property (nonatomic, strong) NSMutableArray *gameThirdArray;
@property (nonatomic, strong) NSMutableArray *allGameArray;
@end

