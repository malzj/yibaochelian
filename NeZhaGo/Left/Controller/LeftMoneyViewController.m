//
//  LeftMoneyViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/13.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftMoneyViewController.h"

@interface LeftMoneyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>
@property (nonatomic ,strong)UILabel *LabelTitle;

@property (nonatomic ,strong)UICollectionView *collectionViewMoney;
@property (nonatomic ,strong)UIView *viewGrays;
@property (nonatomic ,strong)UILabel *labelSim;
@property (nonatomic ,strong)UITextField *textFieldSim;
@property (nonatomic ,strong)UIView *viewLineMoney;

@property (nonatomic ,strong)UIButton *buttonWeChat;
@property (nonatomic ,strong)UIButton *buttonZhiFuBao;
@property (nonatomic ,strong)UIButton *buttonYinLian;

@property (nonatomic ,strong)UIView *viewOneFirst;
@property (nonatomic ,strong)UIView *viewTwoSecond;
@property (nonatomic ,strong)UILabel *labelFast;

@end

@implementation LeftMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.LabelTitle = [UILabel new];
    self.LabelTitle.text = @"充值";
    self.LabelTitle.font = [UIFont systemFontOfSize:18];
    self.LabelTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self.LabelTitle sizeToFit];
    self.navigationItem.titleView = self.LabelTitle;

    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self createSIM];
//    [self createCollection];
    [self createButton];
    
    
}

- (void)createSIM
{
    self.viewGrays = [[UIView alloc]initWithFrame:CGRectMake(0, 310, WIDTH, HEIGHT-300)];
    self.viewGrays.backgroundColor = [UIColor colorWithRed:231/255.0 green:231/255.0 blue:233/255.0 alpha:1];

    [self.view addSubview:self.viewGrays];

    
    self.labelSim = [UILabel new];
    self.labelSim.frame = CGRectMake(10, 75, 65, 30);
    self.labelSim.font = [UIFont systemFontOfSize:15];
    self.labelSim.text = @"SIM卡号:";
    [self.view addSubview:self.labelSim];
    
    
    
    self.textFieldSim = [UITextField new];
    self.textFieldSim.delegate = self;
    self.textFieldSim.placeholder = @"请输入手机号";
    self.textFieldSim.font = [UIFont systemFontOfSize:15];
    self.textFieldSim.backgroundColor = [UIColor colorWithRed:231/255.0 green:231/255.0 blue:233/255.0 alpha:1];
    self.textFieldSim.frame = CGRectMake(80, 75, 270, 30);
    [self.view addSubview:self.textFieldSim];
    
    
    
    self.viewLineMoney = [UIView new];
    self.viewLineMoney.frame = CGRectMake(0, 120, WIDTH, 1);
    //self.viewLineMoney.alpha = 0.8;
    self.viewLineMoney.backgroundColor = [UIColor colorWithRed:231/255.0 green:231/255.0 blue:233/255.0 alpha:1];
    [self.view addSubview:self.viewLineMoney];
    
    
    
    self.viewOneFirst = [UIView new];
    self.viewOneFirst.backgroundColor =  [UIColor redColor];
    self.viewOneFirst.frame = CGRectMake(15, 15, 120, 1);
    [self.viewGrays addSubview:self.viewOneFirst];
    
    
    
    self.viewTwoSecond = [UIView new];
    self.viewTwoSecond.backgroundColor = [UIColor blackColor];
    self.viewTwoSecond.frame = CGRectMake(240, 15, 120, 1);
    [self.viewGrays addSubview:self.viewTwoSecond];
    

    self.labelFast = [UILabel new];
    self.labelFast.font = [UIFont systemFontOfSize:13];
    self.labelFast.text = @"快捷支付";
    self.labelFast.textColor = [UIColor blueColor];
    self.labelFast.frame = CGRectMake(160, 0, 80, 30);
    [self.viewGrays addSubview:self.labelFast];

    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.textFieldSim resignFirstResponder];
}


//- (void)createCollection
//{
//    UICollectionViewFlowLayout *flowMoney = [[UICollectionViewFlowLayout alloc]init];
//    flowMoney.itemSize = CGSizeMake(100, 80);
//    flowMoney.minimumInteritemSpacing = 0;
//    flowMoney.minimumLineSpacing = 0;
//
//    
//    self.collectionViewMoney = [[UICollectionView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>) collectionViewLayout:<#(nonnull UICollectionViewLayout *)#>]
//    
//    
//    
//    
//}


- (void)clickLeft:(UIButton*)button
{
     [self.navigationController popViewControllerAnimated:YES];
}


- (void)createButton
{
    self.buttonWeChat = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonWeChat.frame = CGRectMake(15, 70, 100, 70);
    self.buttonWeChat.backgroundColor = [UIColor greenColor];
    [self.buttonWeChat addTarget:self action:@selector(clickChat:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewGrays addSubview:self.buttonWeChat];
    
    
    
    self.buttonZhiFuBao = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonZhiFuBao.frame = CGRectMake(140, 70, 100, 70);
    self.buttonZhiFuBao.backgroundColor = [UIColor cyanColor];
    [self.buttonZhiFuBao addTarget:self action:@selector(clickZHi:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewGrays addSubview:self.buttonZhiFuBao];
    
    
    
    
    
    self.buttonYinLian = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonYinLian.frame = CGRectMake(260, 70, 100, 70);
    self.buttonYinLian.backgroundColor = [UIColor redColor];
    [self.buttonYinLian addTarget:self action:@selector(clickPay:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewGrays addSubview:self.buttonYinLian];

    
    
}


- (void)clickChat:(UIButton *)button
{
    NSLog(@"chat");
}

- (void)clickZHi:(UIButton *)button
{
    NSLog(@"zhifubao");
}

- (void)clickPay:(UIButton *)button
{
    NSLog(@"pay");
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
