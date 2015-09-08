//
//  NewsTableViewCell.h
//  NBA
//
//  Created by Andy on 2015/6/16.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImg;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;

@end
