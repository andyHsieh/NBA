//
//  TeamsInfoClass.m
//  NBA
//
//  Created by Andy on 2015/6/9.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "TeamsInfoClass.h"

@implementation TeamsInfoClass
-(instancetype)init
{
    self = [super init];
    if(self){
        _titleArray = [[NSMutableArray alloc] init];
        _valueArray = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
