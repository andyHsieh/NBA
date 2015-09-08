//
//  MainVIewControllerViewController.h
//  
//
//  Created by Andy on 2015/6/9.
//
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong, nonatomic) NSArray *newsArray;
@end
