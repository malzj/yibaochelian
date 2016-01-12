//
//  SOSViewController.m
//  Nezha
//
//  Created by cz.jin on 15/11/11.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "SOSViewController.h"
#import "masonry.h"
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

@interface SOSViewController ()
{
    UIView *_sv;
}

@end

@implementation SOSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    //[self createLabel];
    //[self createButton];
    [self UIConfig];
}

- (void)UIConfig
{
    
    UILabel *lbl_OneKeySOS = [UILabel new];
    lbl_OneKeySOS.textAlignment = NSTextAlignmentCenter;
    lbl_OneKeySOS.text = @"一键救援服务";
    lbl_OneKeySOS.font = [UIFont systemFontOfSize:20];
    lbl_OneKeySOS.backgroundColor = [UIColor colorWithRed:239.0/255 green:244.0/255 blue:244.0/255 alpha:1];
    [_sv addSubview:lbl_OneKeySOS];
    
    WS(ws);
    [lbl_OneKeySOS mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.centerX.equalTo(_sv.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, 30));
        make.top.equalTo(@0);
        make.left.equalTo(@0);
    }];
    
    UIButton *btn_SOS = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn_SOS setTitle:@"SOS" forState:UIControlStateNormal];
    //btn_SOS.frame = CGRectMake((self.view.frame.size.width-250)/2, 134, 250, 250);
    [btn_SOS setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_SOS addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn_SOS.tag = 300;
    
    btn_SOS.layer.cornerRadius = 20;
    btn_SOS.layer.masksToBounds = YES;
    btn_SOS.backgroundColor = [UIColor blueColor];
    [_sv addSubview:btn_SOS];
    
    [btn_SOS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(lbl_OneKeySOS.mas_centerX);
        make.top.equalTo(lbl_OneKeySOS.mas_bottom).with.offset(40);
        make.size.mas_equalTo(CGSizeMake(250, 250));
    }];
    
    UIButton *btn_OneKey = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn_OneKey setTitle:@"车辆救援" forState:UIControlStateNormal];
    //btn_OneKey.frame = CGRectMake(0, 404, self.view.frame.size.width, 30);
    [btn_OneKey setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn_OneKey.backgroundColor = [UIColor colorWithRed:72.0/255 green:187.0/255 blue:180.0/255 alpha:1];
    [btn_SOS addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn_OneKey.tag = 301;
    [_sv addSubview:btn_OneKey];
    
    [btn_OneKey mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, 30));
        make.top.equalTo(btn_SOS.mas_bottom).with.offset(20);
    }];
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

- (void)click:(UIButton *)button
{
    switch (button.tag) {
        case 300:
#warning add your code here!!!
            break;
        case 301:
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
