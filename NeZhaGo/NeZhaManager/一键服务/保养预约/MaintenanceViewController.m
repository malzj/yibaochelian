//
//  MaintenanceViewController.m
//  Nezha
//
//  Created by cz.jin on 15/11/12.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "MaintenanceViewController.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;  //防止循环引用

@interface MaintenanceViewController ()<UIScrollViewDelegate>

@end

@implementation MaintenanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self createScroll];
}

#pragma mark 底层
- (void)createScroll
{
    WS(ws);
    UIScrollView *maintainOrderView = [UIScrollView new];
    maintainOrderView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
    maintainOrderView.delegate = self;
    // 设置内容大小
    //self.maintainOrderView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
//    //当超出边界时表示是否可以反弹
//    
//    maintainOrderView.bounces=YES;
//    
//    //是否分页
//    
//    maintainOrderView.pagingEnabled=NO;
//    
//    //是否滚动
//    
//    maintainOrderView.scrollEnabled=YES;
    
//    //是否显示边界
//    
//    self.maintainOrderView.showsHorizontalScrollIndicator=NO;
//    
//    //关闭滚动条
//    
//    self.maintainOrderView.showsVerticalScrollIndicator = TRUE;

    [self.view addSubview:maintainOrderView];
    
    [maintainOrderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.contentView = [UIView new];
    //    self.contentView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
    [maintainOrderView addSubview:self.contentView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(maintainOrderView);
        make.width.equalTo(maintainOrderView);
        make.height.equalTo(@820);
    }];
    
    
    [self createBasicInfo];
    [self createVehicleInfo];
    [self createFacilitator];
    [self createFeeCompare];
    [self createProgDetail];
}

//#pragma mark scroll子页面
//-(void)createContentView
//{
//    //WS(ws);
//    self.contentView = [UIView new];
////    self.contentView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
//    [self.maintainOrderView addSubview:self.contentView];
//    
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.maintainOrderView);
//        make.width.equalTo(self.maintainOrderView);
//    }];
//}

#pragma mark 基本信息
- (void)createBasicInfo
{
    self.basicInfoView = [UIView new];
    self.basicInfoView.backgroundColor = [UIColor whiteColor];
    //self.basicInfoView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.basicInfoView];
    
//    self.basicInfoView.frame = CGRectMake(100, 100, 100, 100);
    [self.basicInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@120);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"基本信息";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithHexString:@"0ca69c"];
    titleLabel.layer.borderWidth = 1;
    titleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.basicInfoView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.basicInfoView);
        make.left.and.top.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"姓名:";
    UILabel *telLabel = [UILabel new];
    telLabel.text = @"电话:";
    UILabel *addLabel = [UILabel new];
    addLabel.text = @"地址:";
    [self.basicInfoView addSubview:nameLabel];
    [self.basicInfoView addSubview:telLabel];
    [self.basicInfoView addSubview:addLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).with.offset(15);
        make.left.equalTo(@5);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
    }];
    [telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(nameLabel);
        make.top.equalTo(nameLabel);
        make.left.equalTo(self.basicInfoView.mas_centerX);
    }];
    [addLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(nameLabel);
        make.left.equalTo(nameLabel);
        make.top.equalTo(nameLabel.mas_bottom).with.offset(20);
    }];
}

#pragma mark 车辆信息
- (void)createVehicleInfo
{
    self.vehicleInfoView = [UIView new];
    self.vehicleInfoView.backgroundColor = [UIColor whiteColor];
    //self.vehicleInfoView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.vehicleInfoView];
    
    [self.vehicleInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.basicInfoView.mas_bottom).with.offset(10);
        make.left.equalTo(self.basicInfoView);
        make.width.equalTo(self.basicInfoView);
        make.height.equalTo(@200);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"车辆信息";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithHexString:@"0ca69c"];
    titleLabel.layer.borderWidth = 1;
    titleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.vehicleInfoView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.basicInfoView);
        make.left.and.top.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    UILabel *carNumLabel = [UILabel new];
    UILabel *carBrandLabel = [UILabel new];
    UILabel *carTypeLabel = [UILabel new];
    UILabel *carColorLabel = [UILabel new];
    UILabel *InMileLabel = [UILabel new];
    UILabel *driveMileLabel = [UILabel new];
    UILabel *engineNumLabel = [UILabel new];
    carNumLabel.text = @"车辆牌照:";
    carBrandLabel.text = @"车辆品牌:";
    carTypeLabel.text = @"车      型:";
    carColorLabel.text = @"颜      色:";
    InMileLabel.text = @"进厂里程:";
    driveMileLabel.text = @"行驶里程:";
    engineNumLabel.text = @"发动机号:";
    [self.vehicleInfoView addSubview:carNumLabel];
    [self.vehicleInfoView addSubview:carBrandLabel];
    [self.vehicleInfoView addSubview:carTypeLabel];
    [self.vehicleInfoView addSubview:carColorLabel];
    [self.vehicleInfoView addSubview:InMileLabel];
    [self.vehicleInfoView addSubview:driveMileLabel];
    [self.vehicleInfoView addSubview:engineNumLabel];
    
    
    [carNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).with.offset(15);
        make.left.equalTo(@5);
        make.width.equalTo(@80);
        make.height.equalTo(@15);
    }];
    [carBrandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.vehicleInfoView.mas_centerX);
        make.size.equalTo(carNumLabel);
        make.top.equalTo(carNumLabel);
    }];
    [carTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(carNumLabel.mas_bottom).with.offset(5);
        make.left.equalTo(carNumLabel);
        make.size.equalTo(carNumLabel);
    }];
    [carColorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(carBrandLabel);
        make.size.equalTo(carBrandLabel);
        make.top.equalTo(carTypeLabel);
    }];
    [InMileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(carNumLabel);
        make.top.equalTo(carTypeLabel.mas_bottom).with.offset(20);
        make.left.equalTo(carNumLabel);
    }];
    [driveMileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(carNumLabel);
        make.left.equalTo(carNumLabel);
        make.top.equalTo(InMileLabel.mas_bottom).offset(20);
    }];
    [engineNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(carNumLabel);
        make.left.equalTo(carNumLabel);
        make.top.equalTo(driveMileLabel.mas_bottom).offset(20);
    }];
}

#pragma mark 服务商
- (void)createFacilitator
{
    self.facilitatorView = [UIView new];
    self.facilitatorView.backgroundColor = [UIColor whiteColor];
    //self.facilitatorView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.facilitatorView];
    
    [self.facilitatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.basicInfoView);
        make.left.equalTo(self.basicInfoView);
        make.top.equalTo(self.vehicleInfoView.mas_bottom).with.offset(10);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"选择服务商";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithHexString:@"0ca69c"];
    titleLabel.layer.borderWidth = 1;
    titleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.facilitatorView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.basicInfoView);
        make.left.and.top.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    UILabel *facilitatorLabel = [UILabel new];
    
}

#pragma mark 价格对比
- (void)createFeeCompare
{
    self.feeCompareView = [UIView new];
    self.feeCompareView.backgroundColor = [UIColor whiteColor];
    //self.feeCompareView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.feeCompareView];
    
    [self.feeCompareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.facilitatorView.mas_bottom).with.offset(10);
        make.left.equalTo(self.facilitatorView);
        make.right.equalTo(self.facilitatorView);
        make.height.equalTo(@140);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"价格对比";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithHexString:@"0ca69c"];
    titleLabel.layer.borderWidth = 1;
    titleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.feeCompareView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.basicInfoView);
        make.left.and.top.equalTo(@0);
        make.height.equalTo(@40);
    }];
    UILabel *ssssLabel = [UILabel new];
    UILabel *classOneLabel = [UILabel new];
    UILabel *classTwoLabel = [UILabel new];
    ssssLabel.text = @"宝马4S店:";
    classOneLabel.text = @"一类修理厂:";
    classTwoLabel.text = @"二类修理厂:";
    ssssLabel.textAlignment = NSTextAlignmentCenter;
    ssssLabel.layer.borderWidth = 1;
    ssssLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    classOneLabel.textAlignment = NSTextAlignmentCenter;
    classOneLabel.layer.borderWidth = 1;
    classOneLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    classTwoLabel.textAlignment = NSTextAlignmentCenter;
    classTwoLabel.layer.borderWidth = 1;
    classTwoLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [self.feeCompareView addSubview:ssssLabel];
    [self.feeCompareView addSubview:classOneLabel];
    [self.feeCompareView addSubview:classTwoLabel];
    
    [ssssLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.feeCompareView);
        make.left.equalTo(@0);
        make.top.equalTo(titleLabel.mas_bottom);
        make.height.equalTo(@40);
    }];
    [classOneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.feeCompareView).multipliedBy(0.5);
        make.left.equalTo(@0);
        make.top.equalTo(ssssLabel.mas_bottom);
        make.bottom.equalTo(@0);
    }];
    [classTwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(classOneLabel);
        make.left.equalTo(classOneLabel.mas_right);
        make.top.equalTo(classOneLabel);
    }];
    
}

#pragma mark 项目详情
- (void)createProgDetail
{
    self.progDetailView = [UIView new];
    self.progDetailView.backgroundColor = [UIColor whiteColor];
    //self.progDetailView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.progDetailView];
    
    [self.progDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.feeCompareView.mas_bottom).with.offset(10);
        make.width.equalTo(self.feeCompareView);
        make.centerX.equalTo(self.feeCompareView);
        make.height.equalTo(@180);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"项目详情";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithHexString:@"0ca69c"];
    titleLabel.layer.borderWidth = 1;
    titleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.progDetailView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.basicInfoView);
        make.left.and.top.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    
}

#pragma mark 返回键点击
-(void)clickLeft:(UIButton*)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UIScrollViewDelegate
//只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    //    NSLog(@" scrollViewDidScroll");
    NSLog(@"ContentOffset y is %f",scrollView.contentOffset.y);
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
