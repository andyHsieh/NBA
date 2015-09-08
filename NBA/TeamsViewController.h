//
//  TeamsViewController.h
//  
//
//  Created by Andy on 2015/6/9.
//
//

#import <UIKit/UIKit.h>

@interface TeamsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *teamsTableView;
@property (nonatomic, strong) NSMutableArray *eastArray;
@property (nonatomic, strong) NSMutableArray *westArray;

@end
