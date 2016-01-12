//
//  LeftAboutViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/11.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftAboutViewController.h"
#import "Masonry.h"
#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;

@interface LeftAboutViewController ()

@end

@implementation LeftAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    
    [self createList];
    [self createLogo];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];


}

-(void)clickLeft:(UIButton*)button

{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)createLogo
{
    UILabel *lbl_Logo = [UILabel new];
    lbl_Logo.text = @"www.ybclgps.com";
    lbl_Logo.textColor = [UIColor colorWithHexString:@"#666666"];
    lbl_Logo.textAlignment = NSTextAlignmentCenter;
    lbl_Logo.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:lbl_Logo];
    
    WS(ws);
    [lbl_Logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.basicLineView.mas_top).with.offset(-20);
        make.width.equalTo(ws.view);
        make.height.equalTo(@17);
    }];
}

- (void)createList
{
    /**
     创建基准分割线
     */
    self.basicLineView = [UIView new];
    self.basicLineView.backgroundColor = [UIColor colorWithHexString:@"C2C2C2"];
    [self.view addSubview:self.basicLineView];
    WS(ws);
    
    [self.basicLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(113);
        make.width.equalTo(ws.view);
        make.height.equalTo(@1);
        make.left.equalTo(ws.view);
    }];
    
    /**
     添加剩余分割线
     */
    NSMutableArray *lineArray = [NSMutableArray array];
    for (int i=0; i<7; i++) {
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithHexString:@"#C2C2C2"];
        [self.view addSubview:lineView];
        [lineArray addObject:lineView];
        
        if (i==0) {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.basicLineView.mas_bottom).with.offset(45);
                make.left.equalTo(self.basicLineView);
                make.size.mas_equalTo(self.basicLineView);
            }];
        }
        else
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(((UIView *)lineArray[i-1]).mas_bottom).with.offset(45);
                make.left.equalTo(self.basicLineView);
                make.size.mas_equalTo(self.basicLineView);
            }];
        }
    }
    
    /**
     关于哪吒内容底图
     */
    NSArray *listNameArr = @[@"基本介绍", @"使用帮助", @"流量问题", @"安全问题", @"检测更新", @"联系我们", @"意见反馈"];
    for (int i=0; i<listNameArr.count; i++) {
        UIView *listBGView = [UIView new];
        listBGView.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
        listBGView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        [listBGView addGestureRecognizer:tap];
        [self.view addSubview:listBGView];
        
        /**
         底图排列
         */
        if (i==0) {
            [listBGView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.basicLineView.mas_bottom);
                make.left.equalTo(self.basicLineView);
                make.width.equalTo(self.basicLineView);
                make.height.equalTo(@45);
            }];
        }
        else
        {
            [listBGView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(((UIView *)lineArray[i-1]).mas_bottom);
                make.left.equalTo(self.basicLineView);
                make.width.equalTo(self.basicLineView);
                make.height.equalTo(@45);
            }];
        }
        
        /**
         给每条添加内容
         */
        UILabel *label = [UILabel new];
        label.text = listNameArr[i];
        label.textColor = [UIColor colorWithHexString:@"#444444"];
        [listBGView addSubview:label];
        
        /**
         内容排列
         */
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(listBGView).with.offset(10);
            make.height.equalTo(@16);
            make.width.equalTo(@100);
            make.top.equalTo(listBGView).with.offset(14);
        }];
        
        /**
         添加箭头
         */
        UIImageView *arrowView = [UIImageView new];
        arrowView.image = [UIImage imageNamed:@"进入按钮"];
        [listBGView addSubview:arrowView];
        
        /**
         箭头排列
         */
        [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(listBGView).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(8, 15));
            make.centerY.mas_equalTo(listBGView.mas_centerY);
        }];
    }
    
}

- (void)click:(UITapGestureRecognizer *)sender
{
    UIView *view = (UIView *)sender.view;
    NSInteger index = view.tag;
    NSLog(@"%ld", index);
//    OtherViewController *other = [[OtherViewController alloc] init];
//    [self.navigationController pushViewController:other animated:YES];
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
