//
//  ProgressQueryViewController.m
//  Nezha
//
//  Created by cz.jin on 15/11/11.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "ProgressQueryViewController.h"
#import "masonry.h"

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

@interface ProgressQueryViewController ()
{
    UIView *_UV_4S;         //4S店相关块
    UIView *_UV_pro;        //保养项目相关块
    UIView *_UV_step;       //步骤相关块
    UIButton *_btn_Video;   //查看视频按键
}

@end

@implementation ProgressQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self UIConfig];
    [self createButton];
    [self createLabel];
}

- (void)createLabel
{
    WS(ws);
    /**
     4S店模块
     */
    UILabel *lbl_4sName = [UILabel new];        //4S店名
    UILabel *lbl_class = [UILabel new];         //班组
    UILabel *lbl_category = [UILabel new];      //类别
    
    //此处添加label属性
    lbl_4sName.backgroundColor = [UIColor clearColor];
    lbl_4sName.text = @"4S 店:濠杰汽车服务";
    lbl_4sName.font = [UIFont systemFontOfSize:13];
//    lbl_4sName.textAlignment = NSTextAlignmentCenter;
//    lbl_4sName.textColor = [UIColor whiteColor];
    
    lbl_class.backgroundColor = [UIColor clearColor];
    lbl_class.text = @"班组:维修一组";
    lbl_class.font = [UIFont systemFontOfSize:13];
//    lbl_class.textAlignment = NSTextAlignmentCenter;
//    lbl_class.textColor = [UIColor whiteColor];
    
    lbl_category.backgroundColor = [UIColor clearColor];
    lbl_category.text = @"类别:保养";
    lbl_category.font = [UIFont systemFontOfSize:13];
//    lbl_category.textAlignment = NSTextAlignmentCenter;
//    lbl_category.textColor = [UIColor whiteColor];
    
    [_UV_4S addSubview:lbl_4sName];
    [_UV_4S addSubview:lbl_class];
    [_UV_4S addSubview:lbl_category];
    
    [lbl_4sName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(_UV_4S.mas_left).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width/2-20, 30));
    }];
    
    [lbl_class mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lbl_4sName.mas_bottom);
        make.centerX.equalTo(lbl_4sName.mas_centerX);
        make.size.mas_equalTo(lbl_4sName);
    }];
    
    [lbl_category mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(lbl_4sName.mas_centerX);
        make.size.mas_equalTo(lbl_4sName);
        make.top.equalTo(lbl_class.mas_bottom);
    }];
    
    /**
     项目模块
     */
    
    /**
     步骤模块
     */
    UILabel *lbl_plan = [UILabel new];          //预计时间
    UILabel *lbl_preStep = [UILabel new];       //上一步
    UILabel *lbl_currentStep = [UILabel new];   //当前
    UILabel *lbl_nxtStep = [UILabel new];       //下一步
    
    //此处添加label属性
    lbl_plan.backgroundColor = [UIColor clearColor];
    lbl_plan.text = @"预计2小时完成 剩余 01:07:25";
    lbl_plan.font = [UIFont systemFontOfSize:13];
    //    lbl_4sName.textAlignment = NSTextAlignmentCenter;
//    lbl_plan.textColor = [UIColor whiteColor];
    
    lbl_preStep.backgroundColor = [UIColor clearColor];
    lbl_preStep.text = @"上一步:更换机油、机滤";
    lbl_preStep.font = [UIFont systemFontOfSize:13];
    //    lbl_class.textAlignment = NSTextAlignmentCenter;
//    lbl_preStep.textColor = [UIColor whiteColor];
    
    lbl_currentStep.backgroundColor = [UIColor clearColor];
    lbl_currentStep.text = @"当前状态:加注机油";
    lbl_currentStep.font = [UIFont systemFontOfSize:13];
    //    lbl_category.textAlignment = NSTextAlignmentCenter;
//    lbl_currentStep.textColor = [UIColor whiteColor];
    
    lbl_nxtStep.backgroundColor = [UIColor clearColor];
    lbl_nxtStep.text = @"下一步:常规检测";
    lbl_nxtStep.font = [UIFont systemFontOfSize:13];
    //    lbl_category.textAlignment = NSTextAlignmentCenter;
//    lbl_nxtStep.textColor = [UIColor whiteColor];
    
    lbl_plan.layer.borderColor = [[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1] CGColor];
    lbl_preStep.layer.borderColor = [[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1] CGColor];
    lbl_currentStep.layer.borderColor = [[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1] CGColor];
    lbl_nxtStep.layer.borderColor = [[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1] CGColor];
    
    lbl_plan.layer.borderWidth = 0.5;
    lbl_preStep.layer.borderWidth = 0.5;
    lbl_currentStep.layer.borderWidth = 0.5;
    lbl_nxtStep.layer.borderWidth = 0.5;
    
    [_UV_step addSubview:lbl_plan];
    [_UV_step addSubview:lbl_preStep];
    [_UV_step addSubview:lbl_currentStep];
    [_UV_step addSubview:lbl_nxtStep];
    
    [lbl_plan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, 30));
    }];
    
    [lbl_preStep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lbl_plan.mas_bottom);
        make.centerX.equalTo(lbl_plan.mas_centerX);
        make.size.mas_equalTo(lbl_plan);
    }];
    
    [lbl_currentStep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(lbl_plan.mas_centerX);
        make.size.mas_equalTo(lbl_plan);
        make.top.equalTo(lbl_preStep.mas_bottom);
    }];
    
    [lbl_nxtStep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(lbl_plan.mas_centerX);
        make.size.mas_equalTo(lbl_plan);
        make.top.equalTo(lbl_currentStep.mas_bottom);
    }];
}

- (void)createButton
{
    WS(ws);
    _btn_Video = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn_Video.backgroundColor = [UIColor colorWithRed:143.0/255 green:213.0/255 blue:68.0/255 alpha:1];
    [_btn_Video setTitle:@"查看视频" forState:UIControlStateNormal];
    [_btn_Video setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btn_Video.layer.cornerRadius = 10;
    _btn_Video.layer.masksToBounds = YES;
    [_btn_Video addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn_Video];
    
    [_btn_Video mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.view.mas_centerX);
        make.top.equalTo(_UV_step.mas_bottom).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}

#pragma mark 查看视频按键触发
- (void)click:(UIButton *)button
{
    //add the button click method
}

- (void)UIConfig
{
    
    WS(ws);
    _UV_4S = [UIView new];
    _UV_pro = [UIView new];
    _UV_step = [UIView new];
    
    _UV_4S.backgroundColor = [UIColor colorWithRed:251.0/255 green:251.0/255 blue:251.0/255 alpha:1];
    _UV_pro.backgroundColor = [UIColor colorWithRed:251.0/255 green:251.0/255 blue:251.0/255 alpha:1];
    _UV_step.backgroundColor = [UIColor colorWithRed:251.0/255 green:251.0/255 blue:251.0/255 alpha:1];
    
    _UV_4S.layer.borderWidth = 0.5;
    _UV_pro.layer.borderWidth = 0.5;
    _UV_step.layer.borderWidth = 0.5;
    
    _UV_4S.layer.borderColor = [[UIColor colorWithRed:204.0/255 green:204.0/255 blue:204.0/255 alpha:1] CGColor];
    _UV_pro.layer.borderColor = [[UIColor colorWithRed:204.0/255 green:204.0/255 blue:204.0/255 alpha:1] CGColor];
    _UV_step.layer.borderColor = [[UIColor colorWithRed:204.0/255 green:204.0/255 blue:204.0/255 alpha:1] CGColor];
    
    [self.view addSubview:_UV_4S];
    [self.view addSubview:_UV_pro];
    [self.view addSubview:_UV_step];
    
    [self.view bringSubviewToFront:_UV_4S];
    
    [_UV_4S mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((ws.view.frame.size.width)/2, 90));
        make.top.equalTo(@0);
        make.left.equalTo(@0);
    }];
    
    [_UV_pro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(_UV_4S);
        make.left.equalTo(_UV_4S.mas_right);
        make.top.equalTo(@0);
    }];
    
    [_UV_step mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, 120));
        make.left.equalTo(@0);
        make.top.equalTo(_UV_4S.mas_bottom);
    }];
    
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
