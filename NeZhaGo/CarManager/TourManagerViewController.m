//
//  TourManagerViewController.m
//  Nezha
//
//  Created by cz.jin on 15/11/11.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "TourManagerViewController.h"
#import "masonry.h"
#import "TourManagerView.h"
#import "AlarmView.h"
#import "RecordView.h"
#import "BasicInfoView.h"
#import "UIColor+Hex.h"

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

@interface TourManagerViewController ()<UIScrollViewDelegate>
{
    UIView *_sv;
}

@end

@implementation TourManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self createSV];
    [self createTabNav];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    
    
    
}



-(void)clickLeft:(UIButton*)button
{
     [self.navigationController popViewControllerAnimated:YES];
}



- (void)createSV
{
    _sv = [UIView new];
    _sv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_sv];
    
    WS(ws);
    [_sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, ws.view.frame.size.height-64));
    }];
}

- (void)createTabNav
{
    WS(ws);
    NSArray *textArray = @[@"基本信息", @"行程管理", @"报警统计", @"工况记录"];
    self.labelArray = @[].mutableCopy;
    self.viewArray = @[].mutableCopy;
    for (int i = 0; i < textArray.count; i++) {
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"%@",textArray[i]];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15];
        label.tag = i;
        label.backgroundColor = [UIColor whiteColor];
        label.userInteractionEnabled = YES;
        
        //字体颜色保留
        if (label.tag == 0) {
            label.textColor = [UIColor colorWithHexString:@"#FFAB48"];
            label.font = [UIFont systemFontOfSize:18];
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelColor:)];
        [label addGestureRecognizer:tap];
        [self.labelArray addObject:label];
        [_sv addSubview:label];
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithHexString:@"#D8D8D8"];
        view.tag = i;
        if ((view.tag == 0)) {
            view.backgroundColor = [UIColor colorWithHexString:@"#FFAB48"];
        }
        [self.viewArray addObject:view];
        [_sv addSubview:view];
    
        if (i==0) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.left.equalTo(@0);
                make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width/4, 45));
            }];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(label.mas_bottom);
                make.left.equalTo(@0);
                make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width/4, 1));
            }];
        }
        else
        {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.size.mas_equalTo(self.labelArray[0]);
                make.left.equalTo(((UILabel *)self.labelArray[i-1]).mas_right);
            }];
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(label.mas_bottom);
                make.size.mas_equalTo(self.viewArray[0]);
                make.left.equalTo(((UIView *)self.viewArray[i-1]).mas_right);
            }];
        }
    }
    
    [self createDetailScrollView];
}

- (void)labelColor:(UITapGestureRecognizer *)sender
{
    UILabel *label = (UILabel *)sender.view;
    NSInteger index = label.tag;
    
    /**
     字体颜色保留
     */
    for (UILabel *label in self.labelArray) {
        if (label.tag == index) {
            
            label.textColor = [UIColor colorWithHexString:@"#FFAB48"];
            label.font = [UIFont systemFontOfSize:18];
        }else{
            
            label.textColor = [UIColor colorWithHexString:@"#464646"];
            label.font = [UIFont systemFontOfSize:15];
        }
    }
    for (UIView *view in self.viewArray) {
        if (view.tag == index) {
            view.backgroundColor = [UIColor colorWithHexString:@"#FFAB48"];
        }
        else
        {
            view.backgroundColor = [UIColor colorWithHexString:@"#D8D8D8"];
        }
    }
    
    self.detailScrollView.contentOffset = CGPointMake(self.view.frame.size.width *index, 0);
    
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        self.detailScrollView.contentOffset = CGPointMake(self.view.frame.size.width *index, 0);
//    }];

}

- (void)createDetailScrollView
{
    WS(ws);
    self.detailScrollView = [UIScrollView new/*[UIScrollView alloc] initWithFrame:CGRectMake(0, 33, self.view.frame.size.width, self.view.frame.size.height-64-33)*/];
    self.detailScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.frame.size.height-64-33);
    self.detailScrollView.delegate = self;
    self.detailScrollView.pagingEnabled = YES;
    self.detailScrollView.showsVerticalScrollIndicator = NO;
    self.detailScrollView.showsHorizontalScrollIndicator = NO;
    [_sv addSubview:self.detailScrollView];
    
    [self.detailScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(((UIView *)self.viewArray[0]).mas_bottom);
        make.left.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, ws.view.frame.size.height-64-33));
    }];
    
    TourManagerView *tourView = [TourManagerView new];
    AlarmView *alarmView = [AlarmView new];
    RecordView *recordView = [RecordView new];
    BasicInfoView *infoView = [BasicInfoView new];
    NSArray *viewsArray = @[infoView, tourView, alarmView, recordView];
    for (int i = 0; i < viewsArray.count; i++) {
        UIView *view = viewsArray[i];
        //view.frame = CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height-64-33);
        [self.detailScrollView addSubview:view];
        
        if (i==0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.left.equalTo(@0);
                make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, ws.view.frame.size.height-64-33));
            }];
        }
        else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.left.equalTo(((UIView *)viewsArray[i-1]).mas_right);
                make.size.mas_equalTo(viewsArray[0]);
            }];
        }
    }
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/self.view.frame.size.width;
    /**
     字体颜色保留
     */
    for (UILabel *label in self.labelArray) {
        if (label.tag == index) {
            
            label.textColor = [UIColor colorWithHexString:@"#FFAB48"];
            label.font = [UIFont systemFontOfSize:18];
        }else{
            
            label.textColor = [UIColor colorWithHexString:@"#464646"];
            label.font = [UIFont systemFontOfSize:15];
        }
    }
    for (UIView *view in self.viewArray) {
        if (view.tag == index) {
            view.backgroundColor = [UIColor colorWithHexString:@"#FFAB48"];
        }
        else
        {
            view.backgroundColor = [UIColor colorWithHexString:@"#D8D8D8"];
        }
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
