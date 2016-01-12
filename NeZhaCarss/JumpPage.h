//
//  JumpPage.h
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/8.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block)(UIViewController *);


@interface JumpPage : NSObject

@property (nonatomic, copy)Block block;

+ (JumpPage *)shareJumpPage;

@end
