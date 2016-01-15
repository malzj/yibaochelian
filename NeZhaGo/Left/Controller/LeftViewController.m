//
//  LeftViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/6.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "MyMassageViewController.h"
#import "LeftTableViewCell.h"
#import "UIColor+Hex.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
#import "LeftMassageViewController.h"
#import "LeftAboutViewController.h"
#import "LeftMoneyViewController.h"
#import "LeftSheZhiViewController.h"
#import "JumpPage.h"
#import "CarMassageViewController.h"
@interface LeftViewController ()
@property (nonatomic ,strong)UIImageView *imageViewLeft;
//@property (nonatomic ,strong)UITableView *tableViewLeft;
@property (nonatomic ,strong)UIView *viewHead;
@property (nonatomic ,strong)UIView *viewOverCar;
#warning ---head
@property (nonatomic ,strong) UIButton *buttonPhoto;
@property (nonatomic ,strong) UILabel *labelName;
@property (nonatomic ,strong) UIButton *buttonMassage;
@property (nonatomic ,strong) UIButton *buttonMap;
@property (nonatomic ,strong) UIButton *buttonCar;
@property (nonatomic ,strong) UIButton *buttonGuanYu;
@property (nonatomic ,strong) UIButton *buttonSheZhi;
@property (nonatomic ,strong) UIButton *buttonMoney;
@property (nonatomic ,strong) UIButton *buttonBack;
@property (nonatomic ,strong) UILabel *labelMassage;
@property (nonatomic ,strong) UILabel *labelMap;
@property (nonatomic ,strong) UILabel *labelCar;
@property (nonatomic ,strong) UILabel *labelGuanYu;
@property (nonatomic ,strong) UILabel *labelSheZhi;
@property (nonatomic ,strong) UILabel *labelMoney;
@property (nonatomic ,strong) UILabel *labelBack;
@property (nonatomic ,strong) UIImageView *imageMassage;
@property (nonatomic ,strong) UIImageView *imageMap;
@property (nonatomic ,strong) UIImageView *imageCar;
@property (nonatomic ,strong) UIImageView *imageGuanYu;
@property (nonatomic ,strong) UIImageView *imageSheZhi;
@property (nonatomic ,strong) UIImageView *imageMoney;
@property (nonatomic ,strong) UIImageView *imageBack;
@property (nonatomic ,strong) UIView *viewLineFirst;
@property (nonatomic ,strong) UIView *viewLineSecond;
@property (nonatomic ,strong) UILabel *labelOver;
@property (nonatomic ,strong) UILabel *labelNumber;
@property (nonatomic ,strong) UILabel *labelOnline;
@property (nonatomic ,strong) UILabel *labelNumberSecond;
@property (nonatomic ,strong) UILabel *labelLeave;
@property (nonatomic ,strong) UILabel *labelNumberThird;
@property (nonatomic ,strong) UISearchBar *searchCar;
@end
@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageViewLeft = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageViewLeft.image = [UIImage imageNamed:@"背景"];
    [self.view addSubview:_imageViewLeft];
//    [self createTable];
//    [self createHead];
    [self createHeadView];
}
- (void)createHeadView
{
    _buttonPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonPhoto.frame = CGRectMake(100, 50, 46, 46);
    _buttonPhoto.layer.cornerRadius = 1;
    _buttonPhoto.layer.masksToBounds = YES;
    [_buttonPhoto setImage:[UIImage imageNamed:@"头像"] forState:UIControlStateNormal];
    [self.view addSubview:_buttonPhoto];
    [_buttonPhoto addTarget:self action:@selector(clickButtonPhoto:) forControlEvents:UIControlEventTouchUpInside];
    _labelName = [[UILabel alloc]initWithFrame:CGRectMake(60, 94, 200, 40)];
    _labelName.font = [UIFont systemFontOfSize:18];
    _labelName.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _labelName.text = @"细雨轻风53467";
    [self.view addSubview:_labelName];
#warning -----我的消息
    _buttonMassage = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonMassage.frame = CGRectMake(0, 140, 275, 50);
    _buttonMassage.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_buttonMassage];
    [_buttonMassage addTarget:self action:@selector(clickMassage:) forControlEvents:UIControlEventTouchUpInside];
    _imageMassage = [[UIImageView alloc]initWithFrame:CGRectMake(70, 5, 25, 25)];
    [_buttonMassage addSubview:_imageMassage];
    [_imageMassage setImage:[UIImage imageNamed:@"我的消息图标-0"]];
    _labelMassage = [UILabel new];
    _labelMassage.frame = CGRectMake(105, 5, 100, 30);
    _labelMassage.font = [UIFont systemFontOfSize:14];
    _labelMassage.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _labelMassage.text = @"我的消息";
    [_buttonMassage addSubview:_labelMassage];
    _buttonMap = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonMap.frame = CGRectMake(0, 191, 275, 50);
    _buttonMap.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_buttonMap];
    [_buttonMap addTarget:self action:@selector(clickMap:) forControlEvents:UIControlEventTouchUpInside];
    _imageMap = [[UIImageView alloc]initWithFrame:CGRectMake(70, 5, 25, 25)];
    [_buttonMap addSubview:_imageMap];
    [_imageMap setImage:[UIImage imageNamed:@"离线地图图标-0"]];
    _labelMap = [UILabel new];
    _labelMap.frame = CGRectMake(105, 5, 100, 30);
    _labelMap.font = [UIFont systemFontOfSize:14];
    _labelMap.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _labelMap.text = @"离线地图";
    [_buttonMap addSubview:_labelMap];
    _buttonCar = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonCar.frame = CGRectMake(0, 242, 275, 50);
    _buttonCar.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_buttonCar];
    [_buttonCar addTarget:self action:@selector(clickcar:) forControlEvents:UIControlEventTouchUpInside];
    _imageCar = [[UIImageView alloc]initWithFrame:CGRectMake(70, 5, 25, 25)];
    [_buttonCar addSubview:_imageCar];
    [_imageCar setImage:[UIImage imageNamed:@"车辆信息图标-0"]];
    _labelCar = [UILabel new];
    _labelCar.frame = CGRectMake(105, 5, 100, 30);
    _labelCar.font = [UIFont systemFontOfSize:14];
    _labelCar.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _labelCar.text = @"车辆信息";
    [_buttonCar addSubview:_labelCar];
    self.buttonGuanYu = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonGuanYu.frame = CGRectMake(0, 293, 275, 50);
    self.buttonGuanYu.backgroundColor = [UIColor clearColor];
    [self.buttonGuanYu addTarget:self action:@selector(clickGuanyu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonGuanYu];
    self.imageGuanYu = [[UIImageView alloc]initWithFrame:CGRectMake(70, 5, 25, 25)];
    [self.buttonGuanYu addSubview:self.imageGuanYu];
    [self.imageGuanYu setImage:[UIImage imageNamed:@"关于哪吒图标-0"]];
    _labelGuanYu = [UILabel new];
    _labelGuanYu.frame = CGRectMake(105, 5, 100, 30);
    _labelGuanYu.font = [UIFont systemFontOfSize:14];
    _labelGuanYu.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _labelGuanYu.text = @"关于哪吒";
    [_buttonGuanYu addSubview:_labelGuanYu];
    _buttonSheZhi = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonSheZhi.frame = CGRectMake(0, 344, 275, 50);
    [self.view addSubview:_buttonSheZhi];
    _buttonSheZhi.backgroundColor = [UIColor clearColor];
    [_buttonSheZhi addTarget:self action:@selector(clickShezhi:) forControlEvents:UIControlEventTouchUpInside];
    _imageSheZhi = [[UIImageView alloc]initWithFrame:CGRectMake(70, 5, 25, 25)];
    [_buttonSheZhi addSubview:_imageSheZhi];
    [_imageSheZhi setImage:[UIImage imageNamed:@"设置图标"]];
    _labelSheZhi = [UILabel new];
    _labelSheZhi.frame = CGRectMake(105, 5, 100, 30);
    _labelSheZhi.font = [UIFont systemFontOfSize:14];
    _labelSheZhi.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _labelSheZhi.text = @"设置";
    [_buttonSheZhi addSubview:_labelSheZhi];
    _buttonMoney = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonMoney.frame = CGRectMake(0, 395, 275, 50);
    [self.view addSubview:_buttonMoney];
    _buttonMoney.backgroundColor = [UIColor clearColor];
    [_buttonMoney addTarget:self action:@selector(clickMoney:) forControlEvents:UIControlEventTouchUpInside];
    _imageMoney = [[UIImageView alloc]initWithFrame:CGRectMake(70, 5, 25, 25)];
    [_buttonMoney addSubview:_imageMoney];
    [_imageMoney setImage:[UIImage imageNamed:@"充值图标-0"]];
    _labelMoney = [UILabel new];
    _labelMoney.frame = CGRectMake(105, 5, 100, 30);
    _labelMoney.font = [UIFont systemFontOfSize:14];
    _labelMoney.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _labelMoney.text = @"充值";
    [_buttonMoney addSubview:_labelMoney];
    _buttonBack = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonBack.frame = CGRectMake(0, 446, 275, 50);
    [self.view addSubview:_buttonBack];
    _buttonBack.backgroundColor = [UIColor clearColor];
    [_buttonBack addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    _imageBack = [[UIImageView alloc]initWithFrame:CGRectMake(70, 5, 25, 25)];
    [_buttonBack addSubview:_imageBack];
    [_imageBack setImage:[UIImage imageNamed:@"注销图标"]];
    _labelBack = [UILabel new];
    _labelBack.frame = CGRectMake(105, 5, 100, 30);
    _labelBack.font = [UIFont systemFontOfSize:14];
    _labelBack.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _labelBack.text = @"注销";
    [_buttonBack addSubview:_labelBack];

}

- (void)clickButtonPhoto:(UIButton *)button
{
    
}


- (void)clickMassage:(UIButton *)button
{
    NSLog(@"massage");

    LeftMassageViewController *leftVC = [[LeftMassageViewController alloc] init];
    
    [JumpPage shareJumpPage].block(leftVC);
}


- (void)clickMap:(UIButton *)button
{
    NSLog(@"离线地图");
}
- (void)clickcar:(UIButton *)button
{
    NSLog(@"车辆信息");
    CarMassageViewController *carMC = [CarMassageViewController new];
    [JumpPage shareJumpPage].block(carMC);

    
    
}

- (void)clickGuanyu:(UIButton *)button
{
    NSLog(@"关于哪吒");
    LeftAboutViewController *aboutVC = [[LeftAboutViewController alloc]init];
    [JumpPage shareJumpPage].block(aboutVC);
}

- (void)clickShezhi:(UIButton *)button
{
    NSLog(@"设置");
    
    LeftSheZhiViewController *leftSheZhi = [LeftSheZhiViewController new];
    [JumpPage shareJumpPage].block(leftSheZhi);
    
}

- (void)clickMoney:(UIButton *)button
{
    NSLog(@"充值");
    LeftMoneyViewController *leftMoney = [LeftMoneyViewController new];
    
    [JumpPage shareJumpPage].block(leftMoney);
    
    
    
}

- (void)clickBack:(UIButton *)button
{
    NSLog(@"注销");
}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 10;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *reuse = @"reuse";
//    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
//    if (!cell) {
//        cell = [[LeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
//    }
//    cell.backgroundColor = [UIColor clearColor];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    
//    if (indexPath.row == 0) {
//        [cell addSubview:cell.searchCar];
//    }else if (indexPath.row == 1){
//        cell.imageViewOnlines.image = [UIImage imageNamed:@"在线"];
//        cell.imagePicture.image = [UIImage imageNamed:@"车辆定位"];
//        cell.labelCarNumber.text = @"京NYC888";
//
//        
//    }else{
//        cell.imagePicture.image = [UIImage imageNamed:@"车辆定位"];
//        cell.labelCarNumber.text = @"京NYC888";
//        cell.imageViewOnlines.image = [UIImage imageNamed:@"离线"];
//    }
//    
//    return cell;
//}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    MyMassageViewController *vc = [[MyMassageViewController alloc] init];
//    [tempAppDelegate.LeftSlideVC closeLeftView];
//    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
//
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row > 9) {
//        return 50;
//    }else{
//        return 60;
//    }
//}






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
