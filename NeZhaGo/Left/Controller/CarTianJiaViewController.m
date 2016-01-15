//
//  CarTianJiaViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/15.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "CarTianJiaViewController.h"

@interface CarTianJiaViewController ()<UITextFieldDelegate>
@property (nonatomic ,strong)UILabel *LabelTitle;
@property (nonatomic ,strong)UILabel *labelCarPersonName;
@property (nonatomic ,strong)UITextField *textFieldCarPersonName;
@property (nonatomic ,strong)UILabel *labelCarNumber;
@property (nonatomic ,strong)UITextField *textFieldCarNumber;
@property (nonatomic ,strong)UILabel *labelPhoneNumber;
@property (nonatomic ,strong)UITextField *textFieldPhoneNumber;
@property (nonatomic ,strong)UILabel *labelCarLogo;
@property (nonatomic ,strong)UILabel *labelSecCarLogo;
@property (nonatomic ,strong)UILabel *labelCarSize;
@property (nonatomic ,strong)UILabel *labelSecCarSize;
@property (nonatomic ,strong)UILabel *labelCarPaiLiang;
@property (nonatomic ,strong)UILabel *labelSecCarPaiLiang;
@property (nonatomic ,strong)UILabel *labelCarColor;
@property (nonatomic ,strong)UITextField *textFieldCarColor;
@property (nonatomic ,strong)UILabel *labelCarJiaHao;
@property (nonatomic ,strong)UITextField *textFieldCarJiaHao;
@property (nonatomic ,strong)UILabel *labelCarFaDongJi;
@property (nonatomic ,strong)UITextField *textFieldCarFaDongJi;
@property (nonatomic ,strong)UILabel *labelSIM;
@property (nonatomic ,strong)UITextField *textFieldSIM;
@property (nonatomic ,strong)UILabel *labelZhongDuan;
@property (nonatomic ,strong)UITextField *textFieldZhongDuan;
@property (nonatomic ,strong)UIButton *buttonErWeiMa;
@property (nonatomic ,strong)UILabel *labelCarXian;
@property (nonatomic ,strong)UILabel *labelJiaZhao;
@property (nonatomic ,strong)UILabel *labeleBeiZhu;
@property (nonatomic ,strong)UITextField *textFieldBeiZhu;
@property (nonatomic ,strong)UIButton *buttonCarsLogo;
@property (nonatomic ,strong)UIButton *buttonCarSize;
@property (nonatomic ,strong)UIButton *buttonCarPaiLiang;
@end

@implementation CarTianJiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.LabelTitle = [UILabel new];
    self.LabelTitle.text = @"添加车辆";
    self.LabelTitle.font = [UIFont systemFontOfSize:18];
    self.LabelTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self.LabelTitle sizeToFit];
    self.navigationItem.titleView = self.LabelTitle;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    
    [self createLabel];
    [self createtextField];
    
}
- (void)clickLeft:(UIButton*)button

{
        
    [self.navigationController popViewControllerAnimated:YES];
        
}


- (void)createLabel
{
    self.labelCarPersonName = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 70, 70)];
    self.labelCarPersonName.font = [UIFont systemFontOfSize:16];
    self.labelCarPersonName.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarPersonName.text = @"车主姓名:";
    [self.view addSubview:self.labelCarPersonName];
    
    
    
    
    self.labelCarNumber = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 70, 70)];
    self.labelCarNumber.font = [UIFont systemFontOfSize:16];
    self.labelCarNumber.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarNumber.text = @"车 牌 号 :";
    [self.view addSubview:self.labelCarNumber];

    
    
    self.labelPhoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(10, 140, 70, 70)];
    self.labelPhoneNumber.font = [UIFont systemFontOfSize:16];
    self.labelPhoneNumber.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelPhoneNumber.text = @"联系电话:";
    [self.view addSubview:self.labelPhoneNumber];

    
    
    
    
    self.labelCarLogo = [[UILabel alloc]initWithFrame:CGRectMake(10, 180, 70, 70)];
    self.labelCarLogo.font = [UIFont systemFontOfSize:16];
    self.labelCarLogo.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarLogo.text = @"车辆品牌:";
    [self.view addSubview:self.labelCarLogo];

    
    
    self.labelCarSize = [[UILabel alloc]initWithFrame:CGRectMake(10, 220, 70, 70)];
    self.labelCarSize.font = [UIFont systemFontOfSize:16];
    self.labelCarSize.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarSize.text = @"车 型 :";
    [self.view addSubview:self.labelCarSize];

    
    
    
    self.labelCarPaiLiang = [[UILabel alloc]initWithFrame:CGRectMake(10, 260, 70, 70)];
    self.labelCarPaiLiang.font = [UIFont systemFontOfSize:16];
    self.labelCarPaiLiang.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarPaiLiang.text = @"排 量 :";
    [self.view addSubview:self.labelCarPaiLiang];

    
    
    
    self.labelCarColor = [[UILabel alloc]initWithFrame:CGRectMake(10, 300, 70, 70)];
    self.labelCarColor.font = [UIFont systemFontOfSize:16];
    self.labelCarColor.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarColor.text = @"颜 色 :";
    [self.view addSubview:self.labelCarColor];

    
    
    
    
    self.labelCarJiaHao = [[UILabel alloc]initWithFrame:CGRectMake(10, 340, 70, 70)];
    self.labelCarJiaHao.font = [UIFont systemFontOfSize:16];
    self.labelCarJiaHao.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarJiaHao.text = @"车 架 号 :";
    [self.view addSubview:self.labelCarJiaHao];

    
    
    
    
    self.labelCarFaDongJi = [[UILabel alloc]initWithFrame:CGRectMake(10, 380, 70, 70)];
    self.labelCarFaDongJi.font = [UIFont systemFontOfSize:16];
    self.labelCarFaDongJi.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarFaDongJi.text = @"发动机号:";
    [self.view addSubview:self.labelCarFaDongJi];

    
    
    
    
    self.labelSIM = [[UILabel alloc]initWithFrame:CGRectMake(10, 420, 70, 70)];
    self.labelSIM.font = [UIFont systemFontOfSize:16];
    self.labelSIM.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelSIM.text = @"SIM卡号:";
    [self.view addSubview:self.labelSIM];

    
    
    self.labelZhongDuan = [[UILabel alloc]initWithFrame:CGRectMake(10, 460, 70, 70)];
    self.labelZhongDuan.font = [UIFont systemFontOfSize:16];
    self.labelZhongDuan.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelZhongDuan.text = @"终 端 号:";
    [self.view addSubview:self.labelZhongDuan];
    
    
    
    
    self.labelCarXian = [[UILabel alloc]initWithFrame:CGRectMake(10, 500, 90, 70)];
    self.labelCarXian.font = [UIFont systemFontOfSize:16];
    self.labelCarXian.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarXian.text = @"车险有效期:";
    [self.view addSubview:self.labelCarXian];
    

    
    
    
    self.labelJiaZhao = [[UILabel alloc]initWithFrame:CGRectMake(10, 540, 90, 70)];
    self.labelJiaZhao.font = [UIFont systemFontOfSize:16];
    self.labelJiaZhao.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelJiaZhao.text = @"驾照有效期:";
    [self.view addSubview:self.labelJiaZhao];
    
    
    
    
    
    self.labeleBeiZhu = [[UILabel alloc]initWithFrame:CGRectMake(10, 580, 70, 70)];
    self.labeleBeiZhu.font = [UIFont systemFontOfSize:16];
    self.labeleBeiZhu.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labeleBeiZhu.text = @"备 注 :";
    [self.view addSubview:self.labeleBeiZhu];
    
    
    
}






- (void)createtextField
{
    _textFieldCarPersonName = [UITextField new];
    _textFieldCarPersonName.delegate = self;
    _textFieldCarPersonName.frame = CGRectMake(90, 80, 270, 30);
    _textFieldCarPersonName.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldCarPersonName.layer.borderWidth = 1;
    _textFieldCarPersonName.layer.cornerRadius = 2;
    _textFieldCarPersonName.layer.masksToBounds = YES;
    _textFieldCarPersonName.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldCarPersonName];
    
    
    _textFieldCarNumber = [UITextField new];
    _textFieldCarNumber.delegate = self;
    _textFieldCarNumber.frame = CGRectMake(90, 120, 270, 30);
    _textFieldCarNumber.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldCarNumber.layer.borderWidth = 1;
    _textFieldCarNumber.layer.cornerRadius = 2;
    _textFieldCarNumber.layer.masksToBounds = YES;
    _textFieldCarNumber.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldCarNumber];
    
    
    _textFieldPhoneNumber = [UITextField new];
    _textFieldPhoneNumber.delegate = self;
    _textFieldPhoneNumber.frame = CGRectMake(90, 160, 270, 30);
    _textFieldPhoneNumber.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldPhoneNumber.layer.borderWidth = 1;
    _textFieldPhoneNumber.layer.cornerRadius = 2;
    _textFieldPhoneNumber.layer.masksToBounds = YES;
    _textFieldPhoneNumber.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldPhoneNumber];

    
    
    
    _labelSecCarLogo = [UILabel new];
    _labelSecCarLogo.frame = CGRectMake(90, 200, 240, 30);
    _labelSecCarLogo.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _labelSecCarLogo.layer.borderWidth = 1;
    _labelSecCarLogo.layer.cornerRadius = 2;
    _labelSecCarLogo.layer.masksToBounds = YES;
    _labelSecCarLogo.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.labelSecCarLogo];
    
    
    
    
    
    self.buttonCarsLogo = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonCarsLogo.layer.borderWidth = 1;
    self.buttonCarsLogo.layer.cornerRadius = 2;
    self.buttonCarsLogo.layer.masksToBounds = YES;
    self.buttonCarsLogo.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.buttonCarsLogo setImage:[UIImage imageNamed:@"向下按钮"] forState:UIControlStateNormal];
    self.buttonCarsLogo.frame = CGRectMake(329, 200, 30, 30);
    [self.view addSubview:self.buttonCarsLogo];
    [self.buttonCarsLogo addTarget:self action:@selector(clickLogo:) forControlEvents:UIControlEventTouchUpInside];

    
    
    
    
    
    _labelSecCarSize = [UILabel new];
    _labelSecCarSize.frame = CGRectMake(90, 240, 240, 30);
    _labelSecCarSize.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _labelSecCarSize.layer.borderWidth = 1;
    _labelSecCarSize.layer.cornerRadius = 2;
    _labelSecCarSize.layer.masksToBounds = YES;
    _labelSecCarSize.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.labelSecCarSize];
    
    
    
    
    self.buttonCarSize = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonCarSize.layer.borderWidth = 1;
    self.buttonCarSize.layer.cornerRadius = 2;
    self.buttonCarSize.layer.masksToBounds = YES;
    self.buttonCarSize.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.buttonCarSize setImage:[UIImage imageNamed:@"向下按钮"] forState:UIControlStateNormal];
    self.buttonCarSize.frame = CGRectMake(329, 240, 30, 30);
    [self.view addSubview:self.buttonCarSize];
    [self.buttonCarSize addTarget:self action:@selector(clickSize:) forControlEvents:UIControlEventTouchUpInside];

    
    
    
    
    
    
    
    
    _labelSecCarPaiLiang = [UILabel new];
    _labelSecCarPaiLiang.frame = CGRectMake(90, 280, 240, 30);
    _labelSecCarPaiLiang.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _labelSecCarPaiLiang.layer.borderWidth = 1;
    _labelSecCarPaiLiang.layer.cornerRadius = 2;
    _labelSecCarPaiLiang.layer.masksToBounds = YES;
    _labelSecCarPaiLiang.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.labelSecCarPaiLiang];
    
    
    
    
    
    
    self.buttonCarPaiLiang = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonCarPaiLiang.layer.borderWidth = 1;
    self.buttonCarPaiLiang.layer.cornerRadius = 2;
    self.buttonCarPaiLiang.layer.masksToBounds = YES;
    self.buttonCarPaiLiang.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.buttonCarPaiLiang setImage:[UIImage imageNamed:@"向下按钮"] forState:UIControlStateNormal];
    self.buttonCarPaiLiang.frame = CGRectMake(329, 280, 30, 30);
    [self.view addSubview:self.buttonCarPaiLiang];
    [self.buttonCarPaiLiang addTarget:self action:@selector(clickPaiLiang:) forControlEvents:UIControlEventTouchUpInside];

    
    
    
    
    
    _textFieldCarColor = [UITextField new];
    _textFieldCarColor.delegate = self;
    _textFieldCarColor.frame = CGRectMake(90, 320, 270, 30);
    _textFieldCarColor.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldCarColor.layer.borderWidth = 1;
    _textFieldCarColor.layer.cornerRadius = 2;
    _textFieldCarColor.layer.masksToBounds = YES;
    _textFieldCarColor.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldCarColor];
    
    
    
    
    
    
    _textFieldCarJiaHao = [UITextField new];
    _textFieldCarJiaHao.delegate = self;
    _textFieldCarJiaHao.frame = CGRectMake(90, 360, 270, 30);
    _textFieldCarJiaHao.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldCarJiaHao.layer.borderWidth = 1;
    _textFieldCarJiaHao.layer.cornerRadius = 2;
    _textFieldCarJiaHao.layer.masksToBounds = YES;
    _textFieldCarJiaHao.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldCarJiaHao];
    
    
    
    
    
    
    _textFieldCarFaDongJi = [UITextField new];
    _textFieldCarFaDongJi.delegate = self;
    _textFieldCarFaDongJi.frame = CGRectMake(90, 400, 270, 30);
    _textFieldCarFaDongJi.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldCarFaDongJi.layer.borderWidth = 1;
    _textFieldCarFaDongJi.layer.cornerRadius = 2;
    _textFieldCarFaDongJi.layer.masksToBounds = YES;
    _textFieldCarFaDongJi.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldCarFaDongJi];
    
    
    
    
    
    
    _textFieldSIM = [UITextField new];
    _textFieldSIM.delegate = self;
    _textFieldSIM.frame = CGRectMake(90, 440, 270, 30);
    _textFieldSIM.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldSIM.layer.borderWidth = 1;
    _textFieldSIM.layer.cornerRadius = 2;
    _textFieldSIM.layer.masksToBounds = YES;
    _textFieldSIM.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldSIM];
    
    
    
    
    _textFieldBeiZhu = [UITextField new];
    _textFieldBeiZhu.delegate = self;
    _textFieldBeiZhu.frame = CGRectMake(90, 600, 270, 60);
    _textFieldBeiZhu.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldBeiZhu.layer.borderWidth = 1;
    _textFieldBeiZhu.layer.cornerRadius = 2;
    _textFieldBeiZhu.layer.masksToBounds = YES;
    _textFieldBeiZhu.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldBeiZhu];

    
    
    _textFieldZhongDuan = [[UITextField alloc]initWithFrame:CGRectMake(90, 480, 130, 30)];
    _textFieldZhongDuan.delegate = self;
    _textFieldZhongDuan.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _textFieldZhongDuan.layer.borderWidth = 1;
    _textFieldZhongDuan.layer.cornerRadius = 2;
    _textFieldZhongDuan.layer.masksToBounds = YES;
    _textFieldZhongDuan.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.textFieldZhongDuan];

    
    
    
    _buttonErWeiMa = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonErWeiMa.frame = CGRectMake(230, 480, 130, 30);
    [self.buttonErWeiMa setImage:[UIImage imageNamed:@"扫描"] forState:UIControlStateNormal];
    _buttonErWeiMa.backgroundColor = [UIColor colorWithHexString:@"6666666"];
    _buttonErWeiMa.layer.borderWidth = 1;
    _buttonErWeiMa.layer.cornerRadius = 2;
    _buttonErWeiMa.layer.masksToBounds = YES;
    _buttonErWeiMa.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.view addSubview:self.buttonErWeiMa];
    [self.buttonErWeiMa addTarget:self action:@selector(clickEr:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)clickLogo:(UIButton *)button
{
    NSLog(@"xuanche");
}

- (void)clickSize:(UIButton *)button
{
    NSLog(@"chexing");
}

- (void)clickPaiLiang:(UIButton *)button
{
    NSLog(@"pailiang");
}



- (void)clickEr:(UIButton *)button
{
    NSLog(@"erweima");
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
