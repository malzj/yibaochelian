//
//  NezhaManagerViewController.m
//  Nezha
//
//  Created by cz.jin on 15/11/11.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "NezhaManagerViewController.h"
#import "OneKeyServiceViewController.h"
#import "SOSViewController.h"
#import "ProgressQueryViewController.h"
#import "MaintainRecordViewController.h"
#import "masonry.h"
#import "LDProgressView.h"
#import "UIColor+Hex.h"

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;

@interface NezhaManagerViewController()
{
    UIView *_sv;
    UIView *_btnZoneView;
    //UIView *_progressView;
    //LDProgressView *_progress;
    UIView *_dataZoneView;

}
@end

@implementation NezhaManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self createSV];
    [self createButtonZone];
    [self createDetailDataZone];
//    [self createButton];
//    [self createLabel];
//    [self createConditionView];
    self.title = @"哪吒管家";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"FFFFFF"]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];

    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

-(void)clickLeft:(UIButton*)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 数据区域
- (void)createDetailDataZone
{
    [self DataZone];
    [self ValidDateZone];
}

- (void)DataZone
{
    _dataZoneView = [UIView new];
    _dataZoneView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    _dataZoneView.layer.borderWidth = 1;
    _dataZoneView.layer.borderColor = [[UIColor colorWithHexString:@"bcbcbc"] CGColor];
    _dataZoneView.layer.cornerRadius = 2;
    _dataZoneView.layer.masksToBounds = YES;
//    _dataZoneView.userInteractionEnabled = YES;
    [_sv addSubview:_dataZoneView];
    
    [_dataZoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_btnZoneView.mas_bottom).with.offset(10);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@200);
    }];
    
    UIView *shadowView = [UIView new];
    shadowView.backgroundColor = [UIColor colorWithHexString:@"#e8e8e8"];
    shadowView.layer.cornerRadius = 2;
    shadowView.layer.masksToBounds = YES;
    [_sv addSubview:shadowView];
    
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_dataZoneView.mas_bottom).with.offset(-0.5);
        make.left.equalTo(_dataZoneView);
        make.width.equalTo(_dataZoneView);
        make.height.equalTo(@2);
    }];
    
    NSArray *lblNameArr = @[@"当前行驶里程:", @"上次保养项目:", @"上次保养里程:", @"上次保养费用:", @"上次保养时间:", @"下次保养费用:"];
    NSMutableArray *lblArr = [NSMutableArray array];
    for (int i=0; i<lblNameArr.count; i++) {
        UILabel *label = [UILabel new];
        label.text = lblNameArr[i];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"#444444"];
        //label.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.2];
        CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
        [_dataZoneView addSubview:label];
        [lblArr addObject:label];
        
        switch (i/2) {
            case 0:
            {
                switch (i%2) {
                    case 0:
                    {
                        [label mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(@15);
                            make.left.equalTo(@5);
                            make.size.mas_equalTo(size);
                        }];
                    }
                        break;
                    default:
                    {
                        [label mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo((UILabel *)lblArr[i-1]);
                            make.left.equalTo(@193);
                            make.size.mas_equalTo(size);
                        }];
                    }
                        break;
                }
            }
                break;
            default:
                switch (i%2) {
                    case 0:
                    {
                        [label mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(((UILabel *)lblArr[i-1]).mas_bottom).with.offset(15);
                            make.left.equalTo(@5);
                            make.size.mas_equalTo(size);
                        }];
                    }
                        break;
                        
                    default:
                    {
                        [label mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo((UILabel *)lblArr[i-1]);
                            make.left.equalTo(@193);
                            make.size.mas_equalTo(size);
                        }];
                    }
                        break;
                }
                break;
        }
    }
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#DEDFE0"];
    [_dataZoneView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(((UILabel *)[lblArr lastObject]).mas_bottom).with.offset(15);
        make.left.equalTo(@0);
        make.width.equalTo(_dataZoneView);
        make.height.equalTo(@1);
    }];
    
    UIView *nxtMaintenanceView = [UIView new];      //底板View
    UILabel *nxtMaintenance = [UILabel new];
    UILabel *lblNxtMaintenance = [UILabel new];

    nxtMaintenance.text = @"距离下次保养:";
    nxtMaintenance.textColor = [UIColor colorWithHexString:@"#444444"];
    nxtMaintenance.font = [UIFont systemFontOfSize:16];
    CGSize size1 = [nxtMaintenance.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}];
    
    lblNxtMaintenance.text = @"1328.6km/1个月";
    lblNxtMaintenance.textColor = [UIColor colorWithHexString:@"#666666"];
    lblNxtMaintenance.font = [UIFont systemFontOfSize:14];
    CGSize size2 = [lblNxtMaintenance.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
    
    [_dataZoneView addSubview:nxtMaintenanceView];
    [nxtMaintenanceView addSubview:nxtMaintenance];
    [nxtMaintenanceView addSubview:lblNxtMaintenance];
    
    [nxtMaintenanceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).with.offset(15);
        make.centerX.equalTo(_dataZoneView);
        make.width.mas_equalTo(size1.width + size2.width + 10);
        make.height.mas_equalTo(size1.height);
    }];
    
    [nxtMaintenance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.size.mas_equalTo(size1);
    }];
    
    [lblNxtMaintenance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nxtMaintenance.mas_right).with.offset(10);
        make.top.equalTo(@0);
        make.size.mas_equalTo(size2);
    }];
    
    UILabel *nxtPro = [UILabel new];
    UIButton *recommendSet = [UIButton buttonWithType:UIButtonTypeSystem];
    UILabel *maintenanceRecord = [UILabel new];
    UIButton *recordSearch = [UIButton buttonWithType:UIButtonTypeSystem];

    nxtPro.text = @"下次保养项目:";
    nxtPro.textColor = [UIColor colorWithHexString:@"#444444"];
    nxtPro.font = [UIFont systemFontOfSize:14];
    CGSize size3 = [nxtPro.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
    [_dataZoneView addSubview:nxtPro];
    
    [recommendSet setTitle:@"推荐套餐" forState:UIControlStateNormal];
    [recommendSet setTitleColor:[UIColor colorWithHexString:@"#0CA69C"] forState:UIControlStateNormal];
    recommendSet.titleLabel.font = [UIFont systemFontOfSize:16];
    recommendSet.tag = 1004;
    CGSize size4 = [recommendSet.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}];
    [recommendSet addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [_dataZoneView addSubview:recommendSet];
    
    [nxtPro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@5);
        make.bottom.equalTo(recommendSet);
        make.size.mas_equalTo(size3);
    }];
    
    [recommendSet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nxtMaintenance.mas_bottom).with.offset(15);
        make.left.equalTo(nxtPro.mas_right).with.offset(5);
        make.size.mas_equalTo(size4);
    }];
    
    maintenanceRecord.text = @"保  养  记  录 :";
    maintenanceRecord.textColor = [UIColor colorWithHexString:@"#444444"];
    maintenanceRecord.font = [UIFont systemFontOfSize:14];
    maintenanceRecord.contentMode = UIViewContentModeScaleToFill;
//    CGSize size5 = [maintenanceRecord.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
    [_dataZoneView addSubview:maintenanceRecord];
    
    [recordSearch setTitle:@"查询" forState:UIControlStateNormal];
    [recordSearch setTitleColor:[UIColor colorWithHexString:@"#0CA69C"] forState:UIControlStateNormal];
    recordSearch.titleLabel.font = [UIFont systemFontOfSize:16];
    recordSearch.tag = 1002;
    CGSize size6 = [recordSearch.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}];
    [recordSearch addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [_dataZoneView addSubview:recordSearch];
    
    [maintenanceRecord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@193);
        make.bottom.equalTo(recommendSet);
        make.size.equalTo(nxtPro);
    }];
    
    [recordSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(maintenanceRecord.mas_right).with.offset(5);
        make.bottom.equalTo(recommendSet);
        make.size.mas_equalTo(size6);
    }];
}

- (void)search:(UIButton *)button
{
    UIView *backView = [UIView new];
    UIView *recommendSetView = [UIView new];
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel *recommendTitle = [UILabel new];
    UIView *lineView = [UIView new];
    UILabel *addTitle = [UILabel new];
    
    switch (button.tag) {
        case 1004:
        {
            NSLog(@"推荐套餐");
            backView.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.5];
            [[UIApplication sharedApplication].keyWindow addSubview:backView];
            self.upView = backView;
            [backView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.left.equalTo(@0);
                make.right.equalTo(@0);
                make.bottom.equalTo(@0);
            }];

            recommendSetView.backgroundColor = [UIColor whiteColor];
            recommendSetView.layer.cornerRadius = 5;
            recommendSetView.tag = 1000;
            recommendSetView.layer.masksToBounds = YES;
            [backView addSubview:recommendSetView];
            
            [recommendSetView mas_makeConstraints:^(MASConstraintMaker *make) {
                //make.center.equalTo(backView);
                //make.height.equalTo(sosView.mas_width);
                make.left.equalTo(@15);
                make.right.equalTo(@-15);
                make.top.equalTo(@80);
                make.bottom.equalTo(@-80);
            }];

            recommendTitle.text = @"推荐项目";
            recommendTitle.textAlignment = NSTextAlignmentCenter;
            recommendTitle.textColor = [UIColor whiteColor];
            recommendTitle.backgroundColor = [UIColor colorWithHexString:@"0CA69C"];
            recommendTitle.userInteractionEnabled = YES;
            [recommendSetView addSubview:recommendTitle];
            
            [recommendTitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(recommendSetView);
                make.height.equalTo(@50);
                make.left.equalTo(@0);
                make.top.equalTo(@0);
            }];
            
            [btnClose setImage:[UIImage imageNamed:@"离线-1"] forState:UIControlStateNormal];
            btnClose.tag = 103;
            [btnClose addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [recommendSetView addSubview:btnClose];
            
            [btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(recommendTitle);
                make.right.equalTo(@-10);
                make.size.mas_equalTo(CGSizeMake(15, 15));
            }];
            
            lineView.backgroundColor = [UIColor colorWithHexString:@"0CA69C"];
            [recommendSetView addSubview:lineView];
            
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(recommendSetView);
                make.top.equalTo(recommendTitle.mas_bottom).with.offset(80);
                make.left.equalTo(@0);
                make.height.equalTo(@1);
            }];
            
            addTitle.text = @"添加项目";
            addTitle.textColor = [UIColor colorWithHexString:@"0CA69C"];
            addTitle.font = [UIFont systemFontOfSize:16];
            CGSize addTitleSize = [addTitle.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
            [recommendSetView addSubview:addTitle];
            
            [addTitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lineView.mas_bottom).with.offset(5);
                make.centerX.equalTo(lineView);
                make.size.mas_equalTo(addTitleSize);
            }];
        }
            break;
        case 1002:
        {
            MaintainRecordViewController *maintainRecordVC = [MaintainRecordViewController new];
            [self.navigationController pushViewController:maintainRecordVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark 剩余区域
- (void)ValidDateZone
{
    UIView *validDataZoneView = [UIView new];
    validDataZoneView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    validDataZoneView.layer.borderWidth = 1;
    validDataZoneView.layer.borderColor = [[UIColor colorWithHexString:@"bcbcbc"] CGColor];
    validDataZoneView.layer.cornerRadius = 2;
    validDataZoneView.layer.masksToBounds = YES;
    [_sv addSubview:validDataZoneView];
    
    UIView *shadowView = [UIView new];
    shadowView.backgroundColor = [UIColor colorWithHexString:@"#e8e8e8"];
    shadowView.layer.cornerRadius = 2;
    shadowView.layer.masksToBounds = YES;
    [_sv addSubview:shadowView];
    
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(validDataZoneView.mas_bottom).with.offset(-0.5);
        make.left.equalTo(validDataZoneView);
        make.width.equalTo(validDataZoneView);
        make.height.equalTo(@2);
    }];
    
    [validDataZoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_dataZoneView);
        make.top.equalTo(_dataZoneView.mas_bottom).with.offset(10);
        make.centerX.equalTo(_dataZoneView);
        make.height.equalTo(@122);
    }];
    
    UIView *line1 = [UIView new];
    line1.backgroundColor = [UIColor colorWithHexString:@"DEDFE0"];
    [validDataZoneView addSubview:line1];
    UIView *line2 = [UIView new];
    line2.backgroundColor = [UIColor colorWithHexString:@"DEDFE0"];
    [validDataZoneView addSubview:line2];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.width.equalTo(validDataZoneView);
        make.centerX.equalTo(validDataZoneView);
        make.top.equalTo(@40);
    }];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(line1);
        make.centerX.equalTo(line1);
        make.top.equalTo(line1.mas_bottom).with.offset(40);
    }];
    
    NSArray *validArray = @[@"车间有效期:", @"保险有效期:", @"驾照有效期:"];
    NSMutableArray *validArr = [NSMutableArray array];
    for (int i=0; i<3; i++) {
        UILabel *label = [UILabel new];
        label.text = validArray[i];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"#444444"];
        CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
        [validDataZoneView addSubview:label];
        [validArr addObject:label];
        
        if (i==0) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(size);
                make.top.equalTo(@12);
                make.left.equalTo(@5);
            }];
        }
        else
        {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(size);
                make.top.equalTo(((UILabel *)validArr[i-1]).mas_bottom).with.offset(24);
                make.left.equalTo(@5);
            }];
        }
        
    }
}

#pragma mark 按键区域
- (void)createButtonZone
{
    _btnZoneView = [UIView new];     //按键域
    UIView *lineView = [UIView new];        //分割线
    
    lineView.backgroundColor = [UIColor colorWithHexString:@"#3DC2B9"];
    _btnZoneView.backgroundColor = [UIColor colorWithHexString:@"0CA69C"];
    [_sv addSubview:_btnZoneView];
    [_sv addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.equalTo(@1);
    }];
    
    [_btnZoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(_sv.mas_width);
        make.height.equalTo(@208);
    }];
    
    [self createButton];
    [self createProgressBar];
}

- (void)createProgressBar
{
    /**
     进度条部分 需要重写.
     */
    LDProgressView *progress = [LDProgressView new];
    progress.color = [UIColor colorWithHexString:@"13db2f"];
    progress.progress = 0.40;           //此处传参
    progress.flat = @NO;
    progress.showText = @NO;
    progress.showBackgroundInnerShadow = @YES;
    progress.type = LDProgressStripes;
    progress.animate = @YES;
    progress.background = [UIColor colorWithHexString:@"23837d"];
    [_btnZoneView addSubview:progress];
    
    [progress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-22);
        make.right.equalTo(@-55);
        make.height.equalTo(@10);
        make.left.equalTo(@55);
    }];
    
    UILabel *lblPer = [UILabel new];
    lblPer.font = [UIFont systemFontOfSize:15];
    lblPer.text = @"40%";               //此处传参
    lblPer.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    CGSize perSize = [lblPer.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]}];
    NSLog(@"%lf", perSize.width);
    [_btnZoneView addSubview:lblPer];
    
    [lblPer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(progress.mas_top).with.offset(-5);
        make.size.mas_equalTo(perSize);
        make.centerX.equalTo(progress);
    }];
    
    UIView *lblBGView = [UIView new];           //盛放3个label的底板
    UILabel *lblState1 = [UILabel new];         //状态:
    UILabel *lblState2 = [UILabel new];         //保养或者维修等等.
    UILabel *lblState3 = [UILabel new];         //进行中...或者已完成
    lblState1.font = [UIFont systemFontOfSize:12];
    lblState1.text = @"状态:";
    lblState1.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    CGSize size1 = [lblState1.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}];
    
    lblState2.font = [UIFont systemFontOfSize:12];
    lblState2.text = @"保养";
    lblState2.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    CGSize size2 = [lblState2.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}];
    
    lblState3.font = [UIFont systemFontOfSize:12];
    lblState3.text = @"进行中....";
    lblState3.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    CGSize size3 = [lblState3.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]}];
    
    [_btnZoneView addSubview:lblBGView];
    [lblBGView addSubview:lblState1];
    [lblBGView addSubview:lblState2];
    [lblBGView addSubview:lblState3];
    
    [lblBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_btnZoneView);
        make.bottom.equalTo(@-5);
        make.size.mas_equalTo(CGSizeMake(size1.width+size2.width+size3.width+15, size1.height));
    }];
    
    [lblState1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.size.mas_equalTo(size1);
    }];

    [lblState2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lblState1);
        make.left.equalTo(lblState1.mas_right).with.offset(10);
        make.size.mas_equalTo(size2);
    }];
    
    [lblState3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lblState1);
        make.left.equalTo(lblState2.mas_right).with.offset(5);
        make.size.mas_equalTo(size3);
    }];
    
}

- (void)createButton
{
    UIButton *btnOKS = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnSOS = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnPQ = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btnOKS setImage:[UIImage imageNamed:@"一键服务"] forState:UIControlStateNormal];
    [btnSOS setImage:[UIImage imageNamed:@"SOS"] forState:UIControlStateNormal];
    [btnPQ setImage:[UIImage imageNamed:@"进度查询"] forState:UIControlStateNormal];
    
    btnOKS.tag = 100;
    btnSOS.tag = 101;
    btnPQ.tag = 102;
    [btnOKS addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btnSOS addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btnPQ addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [_btnZoneView addSubview:btnOKS];
    [_btnZoneView addSubview:btnSOS];
    [_btnZoneView addSubview:btnPQ];
    
    [btnOKS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.right.equalTo(btnSOS.mas_left).with.offset(-23);
        make.size.mas_equalTo(CGSizeMake(95, 95));
    }];
    
    [btnSOS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_btnZoneView);
        make.top.equalTo(@14);
        make.size.mas_equalTo(CGSizeMake(100, 103));
    }];
    
    [btnPQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnOKS);
        make.centerY.equalTo(btnOKS);
        make.size.mas_equalTo(btnOKS);
        make.left.equalTo(btnSOS.mas_right).with.offset(23);
    }];
    
    UILabel *lblOKS = [UILabel new];
    UILabel *lblSOS = [UILabel new];
    UILabel *lblPQ = [UILabel new];
    
    lblOKS.text = @"一键查询";
    lblSOS.text = @"智能救护";
    lblPQ.text = @"进度查询";
    lblOKS.font = [UIFont systemFontOfSize:12];
    lblSOS.font = [UIFont systemFontOfSize:12];
    lblPQ.font = [UIFont systemFontOfSize:12];
    
    lblOKS.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    lblSOS.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    lblPQ.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    
    CGSize OKSSize = [lblOKS.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    CGSize SOSSize = [lblSOS.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    CGSize PQSize = [lblPQ.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    
    [_btnZoneView addSubview:lblOKS];
    [_btnZoneView addSubview:lblSOS];
    [_btnZoneView addSubview:lblPQ];
    
    [lblOKS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnOKS.mas_bottom);
        make.centerX.equalTo(btnOKS);
        make.size.mas_equalTo(OKSSize);
    }];
    
    [lblSOS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnSOS.mas_bottom);
        make.centerX.equalTo(btnSOS);
        make.size.mas_equalTo(SOSSize);
    }];
    
    [lblPQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnPQ.mas_bottom);
        make.centerX.equalTo(btnPQ);
        make.size.mas_equalTo(PQSize);
    }];
}

#pragma mark 界面底板
- (void)createSV
{
    _sv = [UIView new];
    _sv.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    [self.view addSubview:_sv];
    
    [_sv mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.centerX.mas_equalTo(ws.view);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.top.equalTo(@0);
    }];
}

#pragma mark  按键点击方法
- (void)click:(UIButton *)button
{
    OneKeyServiceViewController *oks_VC = [[OneKeyServiceViewController alloc] init];
    ProgressQueryViewController *pq_VC = [[ProgressQueryViewController alloc] init];
    UILabel *sosTitle = [UILabel new];
    UIView *sosBackView = [UIView new];
    UIView *sosView = [UIView new];
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnVehicleRescue = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnEmergencyRescue = [UIButton buttonWithType:UIButtonTypeCustom];
    switch (button.tag) {
        case 100:
            oks_VC.title = @"一键服务";
            [self.navigationController pushViewController:oks_VC animated:YES];
            break;
        case 101:
        {
            sosBackView = [UIView new];
            sosBackView.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.5];
            [[UIApplication sharedApplication].keyWindow addSubview:sosBackView];
            self.upView = sosBackView;
            [sosBackView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.left.equalTo(@0);
                make.right.equalTo(@0);
                make.bottom.equalTo(@0);
            }];
            
            sosView = [UIView new];
            sosView.backgroundColor = [UIColor whiteColor];
            sosView.layer.cornerRadius = 5;
            sosView.tag = 1000;
            sosView.layer.masksToBounds = YES;
            [sosBackView addSubview:sosView];
            
            [sosView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(sosBackView);
                //make.height.equalTo(sosView.mas_width);
                make.left.equalTo(@15);
                make.right.equalTo(@-15);
                make.height.equalTo(@240);
            }];
            
            sosTitle.text = @"智能救护";
            sosTitle.textAlignment = NSTextAlignmentCenter;
            sosTitle.textColor = [UIColor whiteColor];
            sosTitle.backgroundColor = [UIColor colorWithHexString:@"0CA69C"];
            sosTitle.userInteractionEnabled = YES;
            [sosView addSubview:sosTitle];
            
            [sosTitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(sosView);
                make.height.equalTo(@50);
                make.left.equalTo(@0);
                make.top.equalTo(@0);
            }];
            
            [btnClose setImage:[UIImage imageNamed:@"离线-1"] forState:UIControlStateNormal];
            btnClose.tag = 103;
            [btnClose addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [sosView addSubview:btnClose];
            
            [btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(sosTitle);
                make.right.equalTo(@-10);
                make.size.mas_equalTo(CGSizeMake(15, 15));
            }];
            
            [btnVehicleRescue setImage:[UIImage imageNamed:@"微信"] forState:UIControlStateNormal];
            btnVehicleRescue.tag = 104;
            [btnVehicleRescue addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [sosView addSubview:btnVehicleRescue];
            
            [btnEmergencyRescue setImage:[UIImage imageNamed:@"qq登陆框"] forState:UIControlStateNormal];
            btnEmergencyRescue.tag = 105;
            [btnEmergencyRescue addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [sosView addSubview:btnEmergencyRescue];
            
            [btnVehicleRescue mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(sosTitle.mas_bottom).with.offset(20);
                make.left.equalTo(@40);
                make.size.mas_equalTo(CGSizeMake(25, 25));
            }];
            
            [btnEmergencyRescue mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(btnVehicleRescue);
                make.right.equalTo(@-40);
                make.size.mas_equalTo(CGSizeMake(25, 25));
            }];
        }
            
            break;
        case 102:
            pq_VC.title = @"进度查询";
            [self.navigationController pushViewController:pq_VC animated:YES];
            break;
        case 103:
        {
            NSLog(@"关闭");
            [self.upView removeFromSuperview];
        }
            break;
        case 104:
            NSLog(@"车辆救援");
            break;
        case 105:
            NSLog(@"紧急救援");
            break;
            
        default:
            break;
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
