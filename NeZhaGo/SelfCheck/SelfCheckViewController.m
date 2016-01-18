//
//  SelfCheckViewController.m
//  NeZhaCarss
//
//  Created by cz.jin on 16/1/18.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "SelfCheckViewController.h"
#import "UIColor+Hex.h"
#import "Masonry.h"

@interface SelfCheckViewController ()

@end

@implementation SelfCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自检";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"FFFFFF"]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self createDiagZone];
}

- (void)createDiagZone
{
    UIImageView *backImageView = [UIImageView new];
    backImageView.backgroundColor = [UIColor cyanColor];
    backImageView.userInteractionEnabled = YES;
    [self.view addSubview:backImageView];
    
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(@0);
        make.height.equalTo(@240);
    }];
    
    UIButton *btnTCDesc = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *btnDiagAgain = [UIButton buttonWithType:UIButtonTypeSystem];
    
    btnTCDesc.backgroundColor = [UIColor colorWithHexString:@"3EB1AA"];
    [btnTCDesc setTitle:@"故障描述" forState:UIControlStateNormal];
    [btnTCDesc setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnTCDesc.layer.borderColor = [UIColor whiteColor].CGColor;
    btnTCDesc.layer.borderWidth = 1;
    btnTCDesc.layer.cornerRadius = 4;
    btnTCDesc.tag = 56;
    btnTCDesc.layer.masksToBounds = YES;
    [btnTCDesc addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [backImageView addSubview:btnTCDesc];
    
    btnDiagAgain.backgroundColor = [UIColor colorWithHexString:@"3EB1AA"];
    [btnDiagAgain setTitle:@"再次检测" forState:UIControlStateNormal];
    [btnDiagAgain setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnDiagAgain.layer.borderColor = [UIColor whiteColor].CGColor;
    btnDiagAgain.layer.borderWidth = 1;
    btnDiagAgain.layer.cornerRadius = 4;
    btnDiagAgain.layer.masksToBounds = YES;
    [btnDiagAgain addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [backImageView addSubview:btnDiagAgain];
    
    [btnTCDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backImageView.mas_bottom).with.offset(-15);
        make.left.equalTo(@30);
        make.right.equalTo(btnDiagAgain.mas_left).with.offset(-20);
        make.height.equalTo(@40);
    }];
    
    [btnDiagAgain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(btnTCDesc);
        make.right.equalTo(@-30);
        make.left.equalTo(btnTCDesc.mas_right).with.offset(20);
        make.top.equalTo(btnTCDesc);
        make.width.equalTo(btnTCDesc);
    }];
    
    /**
     添加剩余分割线
     */
    NSMutableArray *lineArray = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithHexString:@"#C2C2C2"];
        [self.view addSubview:lineView];
        [lineArray addObject:lineView];
        
        if (i==0) {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(backImageView.mas_bottom).with.offset(45);
                make.left.equalTo(@10);
                make.right.equalTo(@-10);
                make.height.equalTo(@1);
            }];
        }
        else
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(((UIView *)lineArray[i-1]).mas_bottom).with.offset(45);
                make.left.equalTo(@10);
                make.right.equalTo(@-10);
                make.height.equalTo(@1);
            }];
        }
    }
    
    /**
     关于哪吒内容底图
     */
    NSArray *listNameArr = @[@"故障码", @"传感器", @"数据流", @"车辆协议"];
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
                make.top.equalTo(backImageView.mas_bottom);
                make.left.equalTo(@0);
                make.width.equalTo(backImageView);
                make.height.equalTo(@45);
            }];
        }
        else
        {
            [listBGView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(((UIView *)lineArray[i-1]).mas_bottom);
                make.left.equalTo(@0);
                make.width.equalTo(backImageView);
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

- (void)btnClick:(UIButton *)button
{
    if (button.tag == 56) {
        NSLog(@"故障描述");
    }
    else
    {
        NSLog(@"再次检测");
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

-(void)clickLeft:(UIButton*)button
{
    [self.navigationController popViewControllerAnimated:YES];
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
