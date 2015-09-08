//
//  TeamClass.h
//  Nba
//
//  Created by Andy on 2015/5/31.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamClass : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSData *img;
@property (nonatomic, strong) NSString *area;
@property (nonatomic,strong) NSString *coach;
@property (nonatomic) int win;
@property (nonatomic) int lose;
@end
