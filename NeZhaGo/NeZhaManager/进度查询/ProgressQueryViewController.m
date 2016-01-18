//
//  ProgressQueryViewController.m
//  Nezha
//
//  Created by cz.jin on 15/11/11.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "ProgressQueryViewController.h"
#import "masonry.h"
// #import <QuartzCore/QuartzCore.h>

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

@interface ProgressQueryViewController ()

@end

@implementation ProgressQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self createTextProgress];
}

#pragma mark 文字进度
- (void)createTextProgress
{
    self.textProgressView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width-10, 150)];
    self.textProgressView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textProgressView.layer.borderWidth = 1;
    [self.view addSubview:self.textProgressView];
    
//    [self.textProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.and.left.equalTo(@5);
//        make.right.equalTo(@-5);
//        make.height.equalTo(@150);
//    }];
    
    UIImageView *dashLineView = [UIImageView new];
    [self.textProgressView addSubview:dashLineView];
    dashLineView.frame = CGRectMake(10, 80, self.textProgressView.frame.size.width-20, 1);
    
    UIGraphicsBeginImageContext(dashLineView.frame.size);   //开始画线
    [dashLineView.image drawInRect:CGRectMake(0, 0, dashLineView.frame.size.width, dashLineView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //设置线条终点形状
    
    
    CGFloat lengths[] = {10,5}; //虚线样式
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(line, [UIColor redColor].CGColor);
    
    CGContextSetLineDash(line, 0, lengths, 2);  //画虚线
    CGContextMoveToPoint(line, 0.0, 0.0);    //开始画线
    CGContextAddLineToPoint(line, dashLineView.frame.size.width, 0.0);
    CGContextStrokePath(line);
    
    dashLineView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.textProgressView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-30);
        make.width.equalTo(self.textProgressView);
        make.height.equalTo(@1);
        make.left.equalTo(self.textProgressView);
    }];
    
    UILabel *lblFacilitator = [UILabel new];
    lblFacilitator.text = @"服务商:";
    lblFacilitator.font = [UIFont systemFontOfSize:14];
    CGSize faciSize = [lblFacilitator.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
    [self.textProgressView addSubview:lblFacilitator];
    
    [lblFacilitator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(@10);
        make.size.mas_equalTo(faciSize);
    }];
    
    UILabel *lblGroup = [UILabel new];
    lblGroup.text = @"班 组:";
    lblGroup.font = [UIFont systemFontOfSize:14];
    CGSize groupSize = [lblGroup.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
    [self.textProgressView addSubview:lblGroup];
    
    [lblGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(groupSize);
        make.top.equalTo(lblFacilitator);
        make.left.equalTo(self.textProgressView.mas_centerX);
    }];
    
    UILabel *lblMaintain = [UILabel new];
    lblMaintain.text = @"保   养:";
    lblMaintain.font = [UIFont systemFontOfSize:14];
    CGSize maintainSize = [lblMaintain.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    [self.textProgressView addSubview:lblMaintain];
    
    [lblMaintain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lblFacilitator);
        make.top.equalTo(lblFacilitator.mas_bottom).with.offset(15);
        make.size.mas_equalTo(maintainSize);
    }];
    
    UILabel *lblPre = [UILabel new];
    UILabel *lblCur = [UILabel new];
    UILabel *lblNxt = [UILabel new];
    
    lblPre.text = @"上一步:";
    lblCur.text = @"进行中:";
    lblNxt.text = @"下一步:";
    
    lblPre.font = [UIFont systemFontOfSize:12];
    lblCur.font = [UIFont systemFontOfSize:12];
    lblNxt.font = [UIFont systemFontOfSize:12];
    
    CGSize stepSize = [lblPre.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}];
    
    [self.textProgressView addSubview:lblPre];
    [self.textProgressView addSubview:lblCur];
    [self.textProgressView addSubview:lblNxt];
    
    [lblPre mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(stepSize);
        make.left.equalTo(lblFacilitator);
        make.top.equalTo(lineView.mas_bottom).with.offset(7);
    }];
    
    [lblCur mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(stepSize);
        make.left.equalTo(lblPre.mas_right).with.offset(50);
        make.top.equalTo(lblPre);
    }];
    
    [lblNxt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(stepSize);
        make.left.equalTo(lblCur.mas_right).with.offset(50);
        make.top.equalTo(lblPre);
    }];

}

#pragma mark 返回键点击
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
