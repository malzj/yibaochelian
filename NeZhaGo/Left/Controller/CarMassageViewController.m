//
//  CarMassageViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/15.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "CarMassageViewController.h"
#import "CarTianJiaViewController.h"
@interface CarMassageViewController ()
@property (nonatomic ,strong)UIView *viewG;
@property (nonatomic ,strong)UILabel *LabelTitle;
@property (nonatomic ,strong)UISearchBar *searchCarNum;
@property (nonatomic ,strong)UIButton *buttonPush;


@property (nonatomic ,strong)UILabel *labelCarNumb;
@property (nonatomic ,strong)UILabel *labelCarSiz;
@property (nonatomic ,strong)UILabel *labelZhongDuan;



@end

@implementation CarMassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    
    self.viewG = [[UIView alloc]init];
    self.viewG.backgroundColor = [UIColor whiteColor];
    self.viewG.frame = CGRectMake(0, 65, WIDTH, 300),
    [self.view addSubview:self.viewG];
    
    
    self.LabelTitle = [UILabel new];
    self.LabelTitle.text = @"车辆信息";
    self.LabelTitle.font = [UIFont systemFontOfSize:18];
    self.LabelTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self.LabelTitle sizeToFit];
    self.navigationItem.titleView = self.LabelTitle;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self createSearch];
    [self createButton];
}


- (void)createSearch
{
    self.searchCarNum = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 15, 300, 30)];
    //[[self.searchCarNum.subviews objectAtIndex:0]removeFromSuperview];
    self.searchCarNum.placeholder = @"请输入您要搜索的车牌号";
    self.searchCarNum.backgroundColor = [UIColor colorWithRed:215/255.0 green:216/255.0 blue:218/255.0 alpha:1];
    self.searchCarNum.barTintColor = [UIColor whiteColor];
    self.searchCarNum.layer.borderWidth = 1;
    self.searchCarNum.layer.cornerRadius = 4;
    self.searchCarNum.layer.masksToBounds = YES;
    self.searchCarNum.layer.backgroundColor = [UIColor colorWithRed:215/255.0 green:216/255.0 blue:218/255.0 alpha:1].CGColor;
    [self.viewG addSubview:self.searchCarNum];
    
    
    self.labelCarNumb = [UILabel new];
    self.labelCarNumb.frame = CGRectMake(47, 60, 50, 50);
    self.labelCarNumb.font = [UIFont systemFontOfSize:15];
    self.labelCarNumb.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarNumb.text = @"车牌号";
    [self.viewG addSubview:self.labelCarNumb];
    

    
}



- (void)createButton
{
    self.buttonPush = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonPush.frame = CGRectMake(310, 0, 60, 60);
    //self.buttonPush.backgroundColor = [UIColor redColor];
    [self.buttonPush setTitle:@"添加" forState:UIControlStateNormal];
    self.buttonPush.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.buttonPush setTitleColor:[UIColor colorWithRed:0/255.0 green:177/255.0 blue:166/255.0 alpha:1] forState:UIControlStateNormal];
    [self.buttonPush addTarget:self action:@selector(clickPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewG addSubview:self.buttonPush];
}


- (void)clickPush:(UIButton *)button
{
    CarTianJiaViewController *carTianJia = [CarTianJiaViewController new];
    [self.navigationController pushViewController:carTianJia animated:YES];
}




- (void)clickLeft:(UIButton*)button
    
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
