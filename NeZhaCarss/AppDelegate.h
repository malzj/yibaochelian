//
//  AppDelegate.h
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/5.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import <UIKit/UIKit.h>



#import "LeftSlideViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;




@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) UINavigationController *mainNavigationController;


@end

