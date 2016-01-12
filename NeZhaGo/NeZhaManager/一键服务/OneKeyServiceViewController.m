//
//  OneKeyServiceViewController.m
//  Nezha
//
//  Created by cz.jin on 15/11/11.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "OneKeyServiceViewController.h"
#import "MaintenanceViewController.h"
//#import "OtherViewController.h"
#import "Masonry.h"

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;  //防止循环引用

@interface OneKeyServiceViewController ()
{
    UIView *_sv;
}

@end

@implementation OneKeyServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    [self createButton];
}

- (void)createView
{
    _sv = [UIView new];
    _sv.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_sv];
    
    WS(ws);
    [_sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height-64));
    }];
}

- (void)createButton
{
    NSArray *btnNameArray = @[@"保养预约", @"维修预约", @"钣金喷漆", @"美容装饰", @"洗车护理", @"个性改装"];
    NSMutableArray *btnArray = [NSMutableArray array];
    for (int i=0; i<btnNameArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        //button.frame = CGRectMake((self.view.frame.size.width-10)/2*(i%2)+10*(i%2), (self.view.frame.size.width-10)/2*(i/2)+10*(i/2)+64+10, (self.view.frame.size.width-10)/2, (self.view.frame.size.width-10)/2);
        [button setTitle:btnNameArray[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        button.tag = i + 200;
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [_sv addSubview:button];
        [btnArray addObject:button];
    }
    
    //NSLog(@"%@", btnArray[1]);
    
    //WS(ws);
    [btnArray[0] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sv.mas_top).with.offset(10);
        make.left.equalTo(_sv.mas_left).with.offset(0);
        make.right.equalTo(((UIButton *)btnArray[1]).mas_left).with.offset(-10);
        make.width.equalTo(btnArray[1]);
        make.height.mas_equalTo(@80);   //@((_sv.frame.size.width-10)/2)
    }];
    
    [btnArray[1] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sv.mas_top).with.offset(10);
        make.right.equalTo(_sv.mas_right).with.offset(0);
        make.left.equalTo(((UIButton *)btnArray[0]).mas_right).with.offset(10);
        make.width.equalTo(btnArray[0]);
        make.height.mas_equalTo(@80);
    }];
    
    [btnArray[2] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(((UIButton *)btnArray[0]).mas_bottom).with.offset(10);
        make.left.equalTo(_sv.mas_left).with.offset(0);
        make.right.equalTo(((UIButton *)btnArray[3]).mas_left).with.offset(-10);
        make.width.equalTo(btnArray[1]);
        make.height.mas_equalTo(@80);   //@((_sv.frame.size.width-10)/2)
    }];
    
    [btnArray[3] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(((UIButton *)btnArray[1]).mas_bottom).with.offset(10);
        make.right.equalTo(_sv.mas_right).with.offset(0);
        make.left.equalTo(((UIButton *)btnArray[2]).mas_right).with.offset(10);
        make.width.equalTo(btnArray[0]);
        make.height.mas_equalTo(@80);
    }];
    
    [btnArray[4] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(((UIButton *)btnArray[2]).mas_bottom).with.offset(10);
        make.left.equalTo(_sv.mas_left).with.offset(0);
        make.right.equalTo(((UIButton *)btnArray[5]).mas_left).with.offset(-10);
        make.width.equalTo(btnArray[1]);
        make.height.mas_equalTo(@80);   //@((_sv.frame.size.width-10)/2)
    }];
    
    [btnArray[5] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(((UIButton *)btnArray[3]).mas_bottom).with.offset(10);
        make.right.equalTo(_sv.mas_right).with.offset(0);
        make.left.equalTo(((UIButton *)btnArray[4]).mas_right).with.offset(10);
        make.width.equalTo(btnArray[0]);
        make.height.mas_equalTo(@80);
    }];

}

- (void)click:(UIButton *)button
{
    MaintenanceViewController *maintenanceVC = [[MaintenanceViewController alloc] init];
    //OtherViewController *otherVC = [[OtherViewController alloc] init];
    switch (button.tag) {
        case 200:
            maintenanceVC.title = @"保养预约";
            [self.navigationController pushViewController:maintenanceVC animated:YES];
            break;
        case 201:
            //[self.navigationController pushViewController:otherVC animated:YES];
            break;
        case 202:
            //[self.navigationController pushViewController:otherVC animated:YES];
            break;
        case 203:
            //[self.navigationController pushViewController:otherVC animated:YES];
            break;
        case 204:
            //[self.navigationController pushViewController:otherVC animated:YES];
            break;
        case 205:
            //[self.navigationController pushViewController:otherVC animated:YES];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
