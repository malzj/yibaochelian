//
//  JumpPage.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/8.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "JumpPage.h"

@implementation JumpPage

+ (JumpPage *)shareJumpPage
{
    static JumpPage *page = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        page = [[JumpPage alloc] init];
    });
    
    return page;
}

@end
