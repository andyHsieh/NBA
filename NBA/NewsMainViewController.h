//
//  NewsMainViewController.h
//  NBA
//
//  Created by Andy on 2015/6/16.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface NewsMainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *newsImg;
@property (weak, nonatomic) IBOutlet UITextView *newsText;

@property (nonatomic, strong) PFObject *object;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;

@end
