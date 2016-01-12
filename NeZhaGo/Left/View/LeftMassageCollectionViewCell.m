//
//  LeftMassageCollectionViewCell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/8.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftMassageCollectionViewCell.h"






@implementation LeftMassageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createMainView];
    }
    
    return self;
}


 - (void)createMainView
{
    self.viewWhite = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 130)];
    self.viewWhite.backgroundColor = [UIColor whiteColor];
    
    
    
    
    self.labelDateStart = [[UILabel alloc]initWithFrame:CGRectMake(30, 37, 135, 30)];
    self.labelDateStart.backgroundColor = [UIColor grayColor];
    self.labelDateStart.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.labelDateStart.layer.borderWidth = 1;
    self.labelDateStart.layer.cornerRadius = 5;
    self.labelDateStart.layer.masksToBounds = YES;
    self.labelDateStart.alpha = 0.3;
    [self.viewWhite addSubview:self.labelDateStart];
    self.labelDateStart.textAlignment = NSTextAlignmentCenter;
    self.labelDateStart.textColor = [UIColor grayColor];

    
    
    
    self.buttonStart = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonStart.backgroundColor = [UIColor clearColor];
    self.buttonStart.frame = self.labelDateStart.frame;
    [self.viewWhite addSubview:self.buttonStart];
    
    
    
    self.labelDateEnd = [[UILabel alloc]initWithFrame:CGRectMake(220, 37, 135, 30)];
    self.labelDateEnd.layer.backgroundColor = [UIColor grayColor].CGColor;
    self.labelDateEnd.layer.borderWidth = 1;
    self.labelDateEnd.layer.cornerRadius = 5;
    self.labelDateEnd.layer.masksToBounds = YES;
    self.labelDateEnd.alpha = 0.3;
    self.labelDateEnd.textAlignment = NSTextAlignmentCenter;
    self.labelDateEnd.textColor = [UIColor grayColor];

    
    [self.viewWhite addSubview:self.labelDateEnd];

    
    self.buttonEnd = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonEnd.backgroundColor = [UIColor clearColor];
    self.buttonEnd.frame = self.labelDateEnd.frame;
    [self.viewWhite addSubview:self.buttonEnd];
    
   
    [self.buttonEnd addTarget:self action:@selector(clickbuttonEnd:) forControlEvents:UIControlEventTouchUpInside];
    
    
     [self.buttonStart addTarget:self action:@selector(clickbuttonStart:) forControlEvents:UIControlEventTouchUpInside];
    
      
    self.labelCong = [[UILabel alloc]initWithFrame:CGRectMake(5, 42, 30, 20)];
    self.labelCong.textColor = [UIColor grayColor];
    self.labelCong.font = [UIFont systemFontOfSize:13];
    [self.viewWhite addSubview:self.labelCong];
    
    self.labelDao = [[UILabel alloc]initWithFrame:CGRectMake(190, 42, 30, 20)];
    self.labelDao.textColor = [UIColor grayColor];
    self.labelDao.font = [UIFont systemFontOfSize:13];
    [self.viewWhite addSubview:self.labelDao];
    
        
    
    
    
    
    self.buttonSearch =[UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonSearch setTitle:@"搜索" forState:UIControlStateNormal];
    self.buttonSearch.frame = CGRectMake(5, 80, 365, 40);
    self.buttonSearch.backgroundColor = [UIColor colorWithRed:254/255.0 green:167/255.0 blue:50/255.0 alpha:1];
    [self.buttonSearch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.viewWhite addSubview:self.buttonSearch];
    
//    [self.buttonSearch addTarget:self action:@selector(clickSearch:) forControlEvents:UIControlEventTouchUpInside];


}









#warning ------日期
- (void)clickbuttonStart:(UIButton *)button
{
    NSDate *date = [NSDate date];
    NSLog(@"start");
    self.dateView = [[UIView alloc] initWithFrame:CGRectMake(0, 150 , 375, 300)];
    self.dateView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateView];
    
    self.datePickerStart = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickerStart.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickerStart.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickerStart.locale = locale;
    [self.datePickerStart setDate:date animated:YES];
    [self.dateView addSubview:self.datePickerStart];
    
    
    
    self.buttonStartOver = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonStartOver.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonStartOver setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonStartOver addTarget:self action:@selector(clickStartOver:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateView addSubview:self.buttonStartOver];
    
    
    
}

- (void)clickStartOver:(UIButton *)button
{
    NSLog(@"完成");
    
    NSDate *currDate = [self.datePickerEnd date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    self.labelDateStart.textColor = [UIColor redColor];
    self.labelDateStart.text = [NSString stringWithFormat:@"%@",timeString];
    
    [self sendSubviewToBack:self.dateView];
    
    [self.dateView removeFromSuperview];
    
}




- (void)clickbuttonEnd:(UIButton *)button
{
    
    NSLog(@"end");
    
    
    self.dateViewEnd = [[UIView alloc]initWithFrame:CGRectMake(0, 150 , 375, 300)];
    
    self.dateViewEnd.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateViewEnd];
    NSDate *datee = [NSDate date];
    
    self.datePickerEnd = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickerEnd.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickerEnd.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale1 = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickerEnd.locale = locale1;
    [self.datePickerEnd setDate:datee animated:YES];
    [self.dateViewEnd addSubview:self.datePickerEnd];
    
    
    
    self.buttonEndOver = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonEndOver.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonEndOver setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonEndOver addTarget:self action:@selector(clickbuttonED:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateViewEnd addSubview:self.buttonEndOver];
    
    
    
}



- (void)clickbuttonED:(UIButton *)button
{
    NSLog(@"endOver");
    
    
    NSDate *currDate = [self.datePickerStart date];
    // 得到当前的DatePicker的选中的时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    
    self.labelDateEnd.textColor = [UIColor yellowColor];
    self.labelDateEnd.text = [NSString stringWithFormat:@"%@",timeString];
    
    [self sendSubviewToBack:self.dateViewEnd];
    
    [self.dateViewEnd removeFromSuperview];
 
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
