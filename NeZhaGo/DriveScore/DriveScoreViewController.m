//
//  DriveScoreViewController.m
//  NeZhaCarss
//
//  Created by cz.jin on 16/1/19.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "DriveScoreViewController.h"

@interface DriveScoreViewController ()

@end

@implementation DriveScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"驾驶评分";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"FFFFFF"]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self createDateZone];
    [self createStarZone];
    [self createDataZone];
}

- (void)createDateZone
{
    self.dateView = [UIView new];
    self.dateView.backgroundColor = [UIColor colorWithHexString:@"0CA69C"];
    UILabel *fromLabel = [UILabel new];
    UILabel *toLabel = [UILabel new];
    UILabel *lblFromTime = [UILabel new];
    UILabel *lblToTime = [UILabel new];
    
    fromLabel.text = @"从:";
    toLabel.text = @"至:";
    lblFromTime.text = @" 2015-12-01 10:59";
    lblToTime.text = @" 2015-12-01 11:00";
    
    fromLabel.font = [UIFont systemFontOfSize:13];
    toLabel.font = [UIFont systemFontOfSize:13];
    lblFromTime.font = [UIFont systemFontOfSize:12];
    lblToTime.font = [UIFont systemFontOfSize:12];
    
    lblFromTime.backgroundColor = [UIColor whiteColor];
    lblToTime.backgroundColor = [UIColor whiteColor];
    
//    lblFromTime.layer.borderColor = [[UIColor colorWithHexString:@"#999999"] CGColor];
//    lblToTime.layer.borderColor = [[UIColor colorWithHexString:@"#999999"] CGColor];
    
    fromLabel.textColor = [UIColor whiteColor];
    toLabel.textColor = [UIColor whiteColor];
    lblFromTime.textColor = [UIColor lightGrayColor];
    lblToTime.textColor = [UIColor lightGrayColor];

    lblFromTime.layer.cornerRadius = 2;
    lblFromTime.layer.masksToBounds = YES;
    lblToTime.layer.cornerRadius = 2;
    lblToTime.layer.masksToBounds = YES;
    
    CGSize labelSize = [fromLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]}];
//    //    CGSize labelsize = [fromLabel.text sizeWithFont:fromLabel.font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
//    //NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
//    //设置段落模式
//    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//    paragraph.alignment = NSLineBreakByWordWrapping;
//    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13], NSParagraphStyleAttributeName: paragraph};
//    
//    CGSize size = [fromLabel.text boundingRectWithSize:CGSizeMake(100, 0)
//                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
//                                            attributes:attribute
//                                               context:nil].size;
    
    [self.dateView addSubview:fromLabel];
    [self.dateView addSubview:toLabel];
    [self.dateView addSubview:lblFromTime];
    [self.dateView addSubview:lblToTime];
    [self.view addSubview:self.dateView];
    [self.dateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.equalTo(@45);
        make.top.equalTo(@0);
        make.left.equalTo(@0);
    }];
    
    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        //make.bottom.equalTo(self.dateView.mas_top).with.offset(-10);
        make.size.mas_equalTo(labelSize);
    }];
    
    [toLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(fromLabel);
        make.left.equalTo(lblFromTime.mas_right).with.offset(10);
        make.size.equalTo(fromLabel);
    }];
    
    [lblFromTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(fromLabel);
        make.left.equalTo(fromLabel.mas_right).with.offset(10);
        make.right.equalTo(toLabel.mas_left).with.offset(-10);
    }];
    
    [lblToTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(fromLabel);
        make.left.equalTo(toLabel.mas_right).with.offset(10);
        make.right.equalTo(@-10);
        make.size.mas_equalTo(lblFromTime);
    }];
}

- (void)createStarZone
{
    self.starView = [UIView new];
    self.starView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.starView];
    
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateView.mas_bottom);
        make.height.equalTo(@120);
        make.width.equalTo(self.view);
        make.left.equalTo(@0);
    }];
}

- (void)createDataZone
{
    //竖线
    UIView *line1 = [UIView new];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line1];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.starView.mas_bottom);
        make.height.equalTo(@90);
        make.width.equalTo(@1);
    }];
    
    //左侧横线
    UIView *line2 = [UIView new];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line2];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.starView.mas_bottom).with.offset(45);
        make.left.equalTo(@5);
        make.right.equalTo(line1.mas_left).with.offset(-5);
        make.height.equalTo(@1);
    }];
    
    //最高车速
    UILabel *maxSpeed = [UILabel new];
    maxSpeed.text = @"最高车速:";
    maxSpeed.font = [UIFont systemFontOfSize:13];
    CGSize maxSpeedSize = [maxSpeed.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]}];
    [self.view addSubview:maxSpeed];
    
    [maxSpeed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line2);
        make.size.mas_equalTo(maxSpeedSize);
        make.bottom.equalTo(line2.mas_top).with.offset(-10);
    }];
    
    //右侧横线
    UIView *line3 = [UIView new];
    line3.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line3];
    
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2);
        make.left.equalTo(line1.mas_right).with.offset(5);
        make.right.equalTo(@-5);
        make.height.equalTo(@1);
    }];
    
    //最高水温
    UILabel *maxTemp = [UILabel new];
    maxTemp.text = @"最高水温:";
    maxTemp.font = [UIFont systemFontOfSize:13];
    CGSize maxTempSize = [maxTemp.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]}];
    [self.view addSubview:maxTemp];
    
    [maxTemp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line3);
        make.size.mas_equalTo(maxTempSize);
        make.bottom.equalTo(line3.mas_top).with.offset(-10);
    }];
    
    //下侧分割线
    UIView *line4 = [UIView new];
    line4.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line4];
    
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(@5);
        make.right.equalTo(@-5);
        make.height.equalTo(@1);
    }];
    
    //急加速
    UILabel *rapidAcc = [UILabel new];
    rapidAcc.text = @"急加速:";
    rapidAcc.font = [UIFont systemFontOfSize:13];
    CGSize rapidAccSize = [rapidAcc.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]}];
    [self.view addSubview:rapidAcc];
    
    [rapidAcc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line2);
        make.size.mas_equalTo(rapidAccSize);
        make.bottom.equalTo(line4.mas_top).with.offset(-10);
    }];
    
    //急减速
    UILabel *rapidBrake = [UILabel new];
    rapidBrake.text = @"急减速:";
    rapidBrake.font = [UIFont systemFontOfSize:13];
    CGSize rapidBrakeSize = [rapidBrake.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]}];
    [self.view addSubview:rapidBrake];
    
    [rapidBrake mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line3);
        make.size.mas_equalTo(rapidBrakeSize);
        make.bottom.equalTo(line4.mas_top).with.offset(-10);
    }];
    
    NSArray *array = @[@"超转速:", @"超速驾驶:", @"长时间驾驶:", @"停车未熄火:"];
    NSMutableArray *lineArr = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:lineView];
        [lineArr addObject:lineView];
        
        UILabel *label = [UILabel new];
        label.text = array[i];
        label.font = [UIFont systemFontOfSize:13];
        CGSize labelSize = [label.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]}];
        [self.view addSubview:label];
        
        if (i==0) {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(line4.mas_bottom).with.offset(45);
                make.left.equalTo(@5);
                make.right.equalTo(@-5);
                make.height.equalTo(@1);
            }];
            
        }
        else
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@5);
                make.right.equalTo(@-5);
                make.height.equalTo(@1);
                make.top.equalTo(((UIView *)lineArr[i-1]).mas_bottom).with.offset(45);
            }];
        }
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(labelSize);
            make.left.equalTo(lineView);
            make.bottom.equalTo(lineView.mas_top).with.offset(-10);
        }];
        
        UILabel *timeLabel = [UILabel new];
        timeLabel.text = @"时长:";
        timeLabel.font = [UIFont systemFontOfSize:13];
        CGSize timeSize = [timeLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]}];
        [self.view addSubview:timeLabel];
        
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line3);
            make.size.mas_equalTo(timeSize);
            make.bottom.equalTo(lineView.mas_top).with.offset(-10);
        }];
        
    }
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
