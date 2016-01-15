//
//  LeftThirdCollectionViewcell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/12.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftThirdCollectionViewcell.h"

@interface LeftThirdCollectionViewcell ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong)UITableView *tableSearchss;

@end


@implementation LeftThirdCollectionViewcell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createMainViewss];
    }
    
    return self;
}


- (void)createMainViewss
{
    self.viewWhitess = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 130)];
    self.viewWhitess.backgroundColor = [UIColor whiteColor];
    
    self.labelDateStartss = [[UILabel alloc]initWithFrame:CGRectMake(30, 37, 135, 30)];
    self.labelDateStartss.backgroundColor = [UIColor grayColor];
    self.labelDateStartss.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.labelDateStartss.layer.borderWidth = 1;
    self.labelDateStartss.layer.cornerRadius = 5;
    self.labelDateStartss.layer.masksToBounds = YES;
    self.labelDateStartss.alpha = 0.3;
    [self.viewWhitess addSubview:self.labelDateStartss];
    self.labelDateStartss.textAlignment = NSTextAlignmentCenter;
    self.labelDateStartss.textColor = [UIColor grayColor];
    
    self.buttonStartss = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonStartss.backgroundColor = [UIColor clearColor];
    self.buttonStartss.frame = self.labelDateStartss.frame;
    [self.viewWhitess addSubview:self.buttonStartss];
    
    
    
    self.labelDateEndss = [[UILabel alloc]initWithFrame:CGRectMake(220, 37, 135, 30)];
    self.labelDateEndss.layer.backgroundColor = [UIColor grayColor].CGColor;
    self.labelDateEndss.layer.borderWidth = 1;
    self.labelDateEndss.layer.cornerRadius = 5;
    self.labelDateEndss.layer.masksToBounds = YES;
    self.labelDateEndss.alpha = 0.3;
    self.labelDateEndss.textAlignment = NSTextAlignmentCenter;
    self.labelDateEndss.textColor = [UIColor grayColor];
    
    
    [self.viewWhitess addSubview:self.labelDateEndss];
    
    
    self.buttonEndss = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonEndss.backgroundColor = [UIColor clearColor];
    self.buttonEndss.frame = self.labelDateEndss.frame;
    [self.viewWhitess addSubview:self.buttonEndss];
    
    
    [self.buttonEndss addTarget:self action:@selector(clickbuttonEnd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.buttonStartss addTarget:self action:@selector(clickbuttonStart:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelCongss = [[UILabel alloc]initWithFrame:CGRectMake(5, 42, 30, 20)];
    self.labelCongss.textColor = [UIColor grayColor];
    self.labelCongss.font = [UIFont systemFontOfSize:13];
    [self.viewWhitess addSubview:self.labelCongss];
    
    self.labelDaoss = [[UILabel alloc]initWithFrame:CGRectMake(190, 42, 30, 20)];
    self.labelDaoss.textColor = [UIColor grayColor];
    self.labelDaoss.font = [UIFont systemFontOfSize:13];
    [self.viewWhitess addSubview:self.labelDaoss];
    
    
    
    self.buttonSearchss =[UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonSearchss setTitle:@"搜索" forState:UIControlStateNormal];
    self.buttonSearchss.frame = CGRectMake(5, 80, 365, 40);
    self.buttonSearchss.backgroundColor = [UIColor colorWithRed:254/255.0 green:167/255.0 blue:50/255.0 alpha:1];
    [self.buttonSearchss setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.viewWhitess addSubview:self.buttonSearchss];
    
    [self.buttonSearchss addTarget:self action:@selector(clickSearc:) forControlEvents:UIControlEventTouchUpInside];

}



- (UITableView *)tableSearchss
{
    if (!_tableSearchss) {
        
        _tableSearchss = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, 375, 300) style:UITableViewStylePlain];
        
    }
    return _tableSearchss;
}



- (void)clickSearc:(UIButton *)button
{
    NSLog(@"se");
    
    //    self.tableSearchs.backgroundColor = [UIColor redColor];
    [self addSubview:self.tableSearchss];
    _tableSearchss.dataSource = self;
    _tableSearchss.delegate = self;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reu = @"reu";
    UITableViewCell *cel = [tableView dequeueReusableCellWithIdentifier:reu];
    if (!cel) {
        cel = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reu];
    }
    
    
    
    
    return cel;
}







#warning ------日期
- (void)clickbuttonStart:(UIButton *)button
{
    if (self.dateViewss) {
        [self.dateViewss removeFromSuperview];
    }
    
    if (self.dateViewEndss) {
        [self.dateViewEndss removeFromSuperview];
    }
    
    NSDate *date = [NSDate date];
    NSLog(@"start");
    self.dateViewss = [[UIView alloc] initWithFrame:CGRectMake(0, 150 , 375, 300)];
    self.dateViewss.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateViewss];
    
    self.datePickerStartss = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickerStartss.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickerStartss.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickerStartss.locale = locale;
    [self.datePickerStartss setDate:date animated:YES];
    [self.dateViewss addSubview:self.datePickerStartss];
    
    self.buttonStartOverss = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonStartOverss.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonStartOverss setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonStartOverss addTarget:self action:@selector(clickStartOver:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateViewss addSubview:self.buttonStartOverss];
    
    [self bringSubviewToFront:self.dateViewss];
    
}




- (void)clickStartOver:(UIButton *)button
{
    NSLog(@"完成");
    
    NSDate *currDate = [self.datePickerStartss date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    self.labelDateStartss.textColor = [UIColor redColor];
    self.labelDateStartss.text = [NSString stringWithFormat:@"%@",timeString];
    
    [self sendSubviewToBack:self.dateViewss];
    
    [self.dateViewss removeFromSuperview];
    
}




- (void)clickbuttonEnd:(UIButton *)button
{
    
    NSLog(@"end");
    if (self.dateViewss) {
        [self.dateViewss removeFromSuperview];
    }
    
    if (self.dateViewEndss) {
        [self.dateViewEndss removeFromSuperview];
    }
    
    self.dateViewEndss = [[UIView alloc]initWithFrame:CGRectMake(0, 150 , 375, 300)];
    
    self.dateViewEndss.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateViewEndss];
    NSDate *datee = [NSDate date];
    
    self.datePickerEndss = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickerEndss.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickerEndss.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale1 = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickerEndss.locale = locale1;
    [self.datePickerEndss setDate:datee animated:YES];
    [self.dateViewEndss addSubview:self.datePickerEndss];
    
    
    
    self.buttonEndOverss = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonEndOverss.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonEndOverss setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonEndOverss addTarget:self action:@selector(clickbuttonED:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateViewEndss addSubview:self.buttonEndOverss];
    
    
    [self bringSubviewToFront:self.dateViewEndss];
}



- (void)clickbuttonED:(UIButton *)button
{
    NSLog(@"endOver");
    
    
    NSDate *currDate = [self.datePickerEndss date];
    // 得到当前的DatePicker的选中的时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    
    self.labelDateEndss.textColor = [UIColor yellowColor];
    self.labelDateEndss.text = [NSString stringWithFormat:@"%@",timeString];
    
    [self sendSubviewToBack:self.dateViewEndss];
    
    [self.dateViewEndss removeFromSuperview];
    
    
}









/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
