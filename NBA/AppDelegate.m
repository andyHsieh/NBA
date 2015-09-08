//
//  AppDelegate.m
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "TeamsViewController.h"
#import "MainTabBarViewController.h"
#import "GameMainViewController.h"
#import <Parse/Parse.h>
#import "GameScoreViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"MBwS0dLbj4hrqeXPt6OmiBLWZfF2CVPmlxAzXWIp"
                  clientKey:@"aGKwXdCh2ZzvX5zwUe8EanDb8WwhbaFu9B5PzwPJ"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    MainViewController *mainViewController = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
    mainViewController.title = @"新聞總覽";
    UIImage* aImage = [UIImage imageNamed:@"Newspaper24.png"];
    [mainViewController.tabBarItem setImage:aImage];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    
    TeamsViewController *teamsViewController = [[TeamsViewController alloc]initWithNibName:@"TeamsViewController" bundle:nil];
    teamsViewController.title = @"球隊列表";
    UIImage* bImage = [UIImage imageNamed:@"Teamleader24.png"];
    [teamsViewController.tabBarItem setImage:bImage];
    UINavigationController *teamsNav = [[UINavigationController alloc] initWithRootViewController:teamsViewController];
    
    GameMainViewController *gameMainViewController = [[GameMainViewController alloc] initWithNibName:@"GameMainViewController" bundle:nil];
    gameMainViewController.title = @"比賽數據";
    UIImage* cImage = [UIImage imageNamed:@"Basketballplayer24.png"];
    [gameMainViewController.tabBarItem setImage:cImage];
    UINavigationController *gameNav = [[UINavigationController alloc] initWithRootViewController:gameMainViewController];
    
    MainTabBarViewController *mainTabBarViewController = [[MainTabBarViewController alloc] initWithNibName:@"MainTabBarViewController" bundle:nil];
    
    mainTabBarViewController.viewControllers = [NSArray arrayWithObjects:mainNav,teamsNav,gameNav, nil];
    

    self.window.rootViewController = mainTabBarViewController;//making a view to root view
    [self.window makeKeyAndVisible];
    
    self.homeArray = [[NSMutableArray alloc] init];
    self.awayArray = [[NSMutableArray alloc] init];
    
    
    
    
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"update" object:nil userInfo:nil];
    
    
    //------
    //game
    gameTime = 0;
    
    self.gameArray = [[NSMutableArray alloc] init];
    self.allGameArray = [[NSMutableArray alloc] init];
    
    PFQuery *queryFirst = [PFQuery queryWithClassName:@"GameFirst"];
    [queryFirst orderByDescending:@"GameTime"];
    [queryFirst findObjectsInBackgroundWithBlock:^(NSArray *objectFirst, NSError *errorFirst){
        if (!errorFirst) {
            _gameFirstArray = objectFirst;
            for(PFObject *object in _gameFirstArray){
                [_allGameArray addObject:object];
            }
        }else{
            
        }
    }];
    //------------
    PFQuery *querySecond = [PFQuery queryWithClassName:@"GameSecond"];
    [querySecond orderByDescending:@"GameTime"];
    [querySecond findObjectsInBackgroundWithBlock:^(NSArray *objectSecond, NSError *errorSecond){
        if (!errorSecond) {
            _gameSecondArray = objectSecond;
            for(PFObject *object in _gameSecondArray){
                [_allGameArray addObject:object];
            }
        }else{
            
        }
    }];
    //------------
    PFQuery *queryThird = [PFQuery queryWithClassName:@"GameThird"];
    [queryThird orderByDescending:@"GameTime"];
    [queryThird findObjectsInBackgroundWithBlock:^(NSArray *objectThird, NSError *errorThird){
        if (!errorThird) {
            _gameThirdArray = objectThird;
            for(PFObject *object in _gameThirdArray){
                [_allGameArray addObject:object];
            }
        }else{
            
        }
    }];
    
    //------------
    
    PFQuery *query = [PFQuery queryWithClassName:@"Game"];
    [query whereKey:@"UpdateTime" equalTo:[NSNumber numberWithInt:0]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for(PFObject *object in objects){
                [_gameArray insertObject:object atIndex:0];
                [_allGameArray insertObject:object atIndex:0];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updateGame" object:nil userInfo:nil];
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(game) userInfo:nil repeats:YES];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    [self initScore];
    return YES;
}

-(void)initScore
{
    for(int i = 0;i < 9; i++){
        ScoreClass *homeClass = [[ScoreClass alloc]init];
        switch (i) {
            case 0:
                homeClass.palyerName = @"LeBron-James";
                homeClass.point = 20;
                homeClass.rebounts = 9;
                homeClass.assist = 7;
                homeClass.steal = 0;
                homeClass.block = 2;
                homeClass.turnover = 3;
                homeClass.foul = 3;
                break;
            case 1:
                homeClass.palyerName = @"J.R.-Smith";
                homeClass.point = 15;
                homeClass.rebounts = 4;
                homeClass.assist = 5;
                homeClass.steal = 0;
                homeClass.block = 2;
                homeClass.turnover = 2;
                homeClass.foul = 3;
                break;
            case 2:
                homeClass.palyerName = @"James-Jones";
                homeClass.point = 9;
                homeClass.rebounts = 2;
                homeClass.assist = 0;
                homeClass.steal = 0;
                homeClass.block = 0;
                homeClass.turnover = 1;
                homeClass.foul = 2;
                break;
            case 3:
                homeClass.palyerName = @"Kendrick-Perkins";
                homeClass.point = 0;
                homeClass.rebounts = 0;
                homeClass.assist = 0;
                homeClass.steal = 0;
                homeClass.block = 0;
                homeClass.turnover = 0;
                homeClass.foul = 0;
                break;
            case 4:
                homeClass.palyerName = @"Joe-Harris";
                homeClass.point = 0;
                homeClass.rebounts = 2;
                homeClass.assist = 3;
                homeClass.steal = 0;
                homeClass.block = 0;
                homeClass.turnover = 1;
                homeClass.foul = 2;
                break;
            case 5:
                homeClass.palyerName = @"Iman-Shumpert";
                homeClass.point = 11;
                homeClass.rebounts = 3;
                homeClass.assist = 3;
                homeClass.steal = 1;
                homeClass.block = 0;
                homeClass.turnover = 2;
                homeClass.foul = 1;
                break;
            case 6:
                homeClass.palyerName = @"Timofey-Mozgov";
                homeClass.point = 21;
                homeClass.rebounts = 9;
                homeClass.assist = 4;
                homeClass.steal = 1;
                homeClass.block = 2;
                homeClass.turnover = 2;
                homeClass.foul = 3;
                break;
            case 7:
                homeClass.palyerName = @"Matthew-Dellavedova";
                homeClass.point = 9;
                homeClass.rebounts = 4;
                homeClass.assist = 4;
                homeClass.steal = 2;
                homeClass.block = 0;
                homeClass.turnover = 3;
                homeClass.foul = 4;
                break;
            case 8:
                homeClass.palyerName = @"Mike-Miller";
                homeClass.point = 3;
                homeClass.rebounts = 0;
                homeClass.assist = 2;
                homeClass.steal = 0;
                homeClass.block = 2;
                homeClass.turnover = 3;
                homeClass.foul = 3;
                break;
        }
        [_homeArray addObject:homeClass];
    }
    
    for(int i = 0; i < 11; i++){
        ScoreClass *awayClass = [[ScoreClass alloc]init];
        switch (i) {
            case 0:
                awayClass.palyerName = @"Stephen-Curry";
                awayClass.point = 20;
                awayClass.rebounts = 9;
                awayClass.assist = 7;
                awayClass.steal = 0;
                awayClass.block = 2;
                awayClass.turnover = 3;
                awayClass.foul = 3;
                break;
            case 1:
                awayClass.palyerName = @"Leandro-Barbosa";
                awayClass.point = 13;
                awayClass.rebounts = 4;
                awayClass.assist = 5;
                awayClass.steal = 2;
                awayClass.block = 0;
                awayClass.turnover = 2;
                awayClass.foul = 3;
                break;
            case 2:
                awayClass.palyerName = @"Harrison-Barnes";
                awayClass.point = 9;
                awayClass.rebounts = 5;
                awayClass.assist = 2;
                awayClass.steal = 1;
                awayClass.block = 4;
                awayClass.turnover = 3;
                awayClass.foul = 4;
                break;
            case 3:
                awayClass.palyerName = @"Draymond-Green";
                awayClass.point = 13;
                awayClass.rebounts = 9;
                awayClass.assist = 1;
                awayClass.steal = 2;
                awayClass.block = 1;
                awayClass.turnover = 3;
                awayClass.foul = 4;
                break;
            case 4:
                awayClass.palyerName = @"Shaun-Livingston";
                awayClass.point = 12;
                awayClass.rebounts = 3;
                awayClass.assist = 3;
                awayClass.steal = 2;
                awayClass.block = 0;
                awayClass.turnover = 1;
                awayClass.foul = 1;
                break;
            case 5:
                awayClass.palyerName = @"David-Lee";
                awayClass.point = 7;
                awayClass.rebounts = 2;
                awayClass.assist = 3;
                awayClass.steal = 1;
                awayClass.block = 0;
                awayClass.turnover = 2;
                awayClass.foul = 3;
                break;
            case 6:
                awayClass.palyerName = @"Andre-Iguodala";
                awayClass.point = 14;
                awayClass.rebounts = 2;
                awayClass.assist = 5;
                awayClass.steal = 3;
                awayClass.block = 1;
                awayClass.turnover = 2;
                awayClass.foul = 3;
                break;
            case 7:
                awayClass.palyerName = @"Klay-Thompson";
                awayClass.point = 9;
                awayClass.rebounts = 2;
                awayClass.assist = 2;
                awayClass.steal = 0;
                awayClass.block = 0;
                awayClass.turnover = 4;
                awayClass.foul = 5;
                break;
            case 8:
                awayClass.palyerName = @"Marreese-Speights";
                awayClass.point = 8;
                awayClass.rebounts = 4;
                awayClass.assist = 2;
                awayClass.steal = 0;
                awayClass.block = 2;
                awayClass.turnover = 1;
                awayClass.foul = 4;
                break;
            case 9:
                awayClass.palyerName = @"Andrew-Bogut";
                awayClass.point = 0;
                awayClass.rebounts = 4;
                awayClass.assist = 5;
                awayClass.steal = 0;
                awayClass.block = 1;
                awayClass.turnover = 0;
                awayClass.foul = 1;
                break;
            case 10:
                awayClass.palyerName = @"James Michael-McAdoo";
                awayClass.point = 0;
                awayClass.rebounts = 0;
                awayClass.assist = 0;
                awayClass.steal = 0;
                awayClass.block = 0;
                awayClass.turnover = 0;
                awayClass.foul = 0;
                break;
            
        }
        [_awayArray addObject:awayClass];
    }
    
}

-(void)game
{
    PFQuery *query = [PFQuery queryWithClassName:@"Game"];
    [query whereKey:@"UpdateTime" greaterThan:[NSNumber numberWithInt:gameTime]];
    [query whereKey:@"UpdateTime" lessThanOrEqualTo:[NSNumber numberWithInt:gameTime + 15]];
    gameTime += 15;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for(PFObject *object in objects){
                NSString *type = [object objectForKey:@"FirstIncident"];
                BOOL teamBool = [[object objectForKey:@"team"]boolValue];
                NSString *playerName = [object objectForKey:@"FirstName"];
                int value = [[object objectForKey:@"FirstGameValue"]intValue];
                if([type isEqualToString:@"籃板"]){
                    if(teamBool){
                        for(int i = 0; i< [_homeArray count]; i++){
                            ScoreClass *class = [_homeArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.rebounts += value;
                                [_homeArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }else{
                        for(int i = 0; i< [_awayArray count]; i++){
                            ScoreClass *class = [_awayArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.rebounts += value;
                                [_awayArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }
                }else if([type isEqualToString:@"罰球得分"]){
                    if(teamBool){
                        for(int i = 0; i< [_homeArray count]; i++){
                            ScoreClass *class = [_homeArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.point += value;
                                [_homeArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }else{
                        for(int i = 0; i< [_awayArray count]; i++){
                            ScoreClass *class = [_awayArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.point += value;
                                [_awayArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }
                }else if([type isEqualToString:@"犯規"]){
                    if(teamBool){
                        for(int i = 0; i< [_homeArray count]; i++){
                            ScoreClass *class = [_homeArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.foul += value;
                                [_homeArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }else{
                        for(int i = 0; i< [_awayArray count]; i++){
                            ScoreClass *class = [_awayArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.foul += value;
                                [_awayArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }
                }else if([type isEqualToString:@"得分"]){
                    if(teamBool){
                        for(int i = 0; i< [_homeArray count]; i++){
                            ScoreClass *class = [_homeArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.point += value;
                                [_homeArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }else{
                        for(int i = 0; i< [_awayArray count]; i++){
                            ScoreClass *class = [_awayArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.point += value;
                                [_awayArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }
                }else if([type isEqualToString:@"失誤"]){
                    if(teamBool){
                        for(int i = 0; i< [_homeArray count]; i++){
                            ScoreClass *class = [_homeArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.turnover += value;
                                [_homeArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }else{
                        for(int i = 0; i< [_awayArray count]; i++){
                            ScoreClass *class = [_awayArray objectAtIndex:i];
                            if([class.palyerName isEqualToString:playerName]){
                                class.turnover += value;
                                [_awayArray setObject:class atIndexedSubscript:i];
                            }
                        }
                    }
                }
                [_gameArray insertObject:object atIndex:0];
                [_allGameArray insertObject:object atIndex:0];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updateGame" object:nil userInfo:nil];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
