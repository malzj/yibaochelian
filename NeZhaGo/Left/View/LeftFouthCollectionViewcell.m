//
//  LeftFouthCollectionViewcell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/12.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftFouthCollectionViewcell.h"

@interface LeftFouthCollectionViewcell ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)UITableView *tableSearchsss;



@end

@implementation LeftFouthCollectionViewcell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createMainVi];
    }
    
    return self;
}


- (void)createMainVi
{
    self.viewWhitesss = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 130)];
    self.viewWhitesss.backgroundColor = [UIColor whiteColor];
    
    self.labelDateStartsss = [[UILabel alloc]initWithFrame:CGRectMake(30, 37, 135, 30)];
    self.labelDateStartsss.backgroundColor = [UIColor grayColor];
    self.labelDateStartsss.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.labelDateStartsss.layer.borderWidth = 1;
    self.labelDateStartsss.layer.cornerRadius = 5;
    self.labelDateStartsss.layer.masksToBounds = YES;
    self.labelDateStartsss.alpha = 0.3;
    [self.viewWhitesss addSubview:self.labelDateStartsss];
    self.labelDateStartsss.textAlignment = NSTextAlignmentCenter;
    self.labelDateStartsss.textColor = [UIColor grayColor];
    
    self.buttonStartsss = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonStartsss.backgroundColor = [UIColor clearColor];
    self.buttonStartsss.frame = self.labelDateStartsss.frame;
    [self.viewWhitesss addSubview:self.buttonStartsss];
    
    
    
    self.labelDateEndsss = [[UILabel alloc]initWithFrame:CGRectMake(220, 37, 135, 30)];
    self.labelDateEndsss.layer.backgroundColor = [UIColor grayColor].CGColor;
    self.labelDateEndsss.layer.borderWidth = 1;
    self.labelDateEndsss.layer.cornerRadius = 5;
    self.labelDateEndsss.layer.masksToBounds = YES;
    self.labelDateEndsss.alpha = 0.3;
    self.labelDateEndsss.textAlignment = NSTextAlignmentCenter;
    self.labelDateEndsss.textColor = [UIColor grayColor];
    
    
    [self.viewWhitesss addSubview:self.labelDateEndsss];
    
    
    self.buttonEndsss = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonEndsss.backgroundColor = [UIColor clearColor];
    self.buttonEndsss.frame = self.labelDateEndsss.frame;
    [self.viewWhitesss addSubview:self.buttonEndsss];
    
    
    [self.buttonEndsss addTarget:self action:@selector(clickbuttonEnd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.buttonStartsss addTarget:self action:@selector(clickbuttonStart:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelCongsss = [[UILabel alloc]initWithFrame:CGRectMake(5, 42, 30, 20)];
    self.labelCongsss.textColor = [UIColor grayColor];
    self.labelCongsss.font = [UIFont systemFontOfSize:13];
    [self.viewWhitesss addSubview:self.labelCongsss];
    
    self.labelDaosss = [[UILabel alloc]initWithFrame:CGRectMake(190, 42, 30, 20)];
    self.labelDaosss.textColor = [UIColor grayColor];
    self.labelDaosss.font = [UIFont systemFontOfSize:13];
    [self.viewWhitesss addSubview:self.labelDaosss];
    
    
    
    self.buttonSearchsss =[UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonSearchsss setTitle:@"搜索" forState:UIControlStateNormal];
    self.buttonSearchsss.frame = CGRectMake(5, 80, 365, 40);
    self.buttonSearchsss.backgroundColor = [UIColor colorWithRed:254/255.0 green:167/255.0 blue:50/255.0 alpha:1];
    [self.buttonSearchsss setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.viewWhitesss addSubview:self.buttonSearchsss];
    
    [self.buttonSearchsss addTarget:self action:@selector(clickSearc:) forControlEvents:UIControlEventTouchUpInside];
}


- (UITableView *)tableSearchsss
{
    if (!_tableSearchsss) {
        
        _tableSearchsss = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, 375, 300) style:UITableViewStylePlain];
        
    }
    return _tableSearchsss;
}


- (void)clickSearc:(UIButton *)button
{
    NSLog(@"se");
    
    //    self.tableSearchs.backgroundColor = [UIColor redColor];
    [self addSubview:self.tableSearchsss];
    _tableSearchsss.dataSource = self;
    _tableSearchsss.delegate = self;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuaes = @"reuaes";
    UITableViewCell *celers = [tableView dequeueReusableCellWithIdentifier:reuaes];
    if (!celers) {
        celers = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuaes];
    }
    
    return celers;
}













#warning ------日期
- (void)clickbuttonStart:(UIButton *)button
{
    if (self.dateViewsss) {
        [self.dateViewsss removeFromSuperview];
    }
    
    if (self.dateViewEndsss) {
        [self.dateViewEndsss removeFromSuperview];
    }
    
    NSDate *date = [NSDate date];
    NSLog(@"start");
    self.dateViewsss = [[UIView alloc] initWithFrame:CGRectMake(0, 150 , 375, 300)];
    self.dateViewsss.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateViewsss];
    
    self.datePickerStartsss = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickerStartsss.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickerStartsss.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickerStartsss.locale = locale;
    [self.datePickerStartsss setDate:date animated:YES];
    [self.dateViewsss addSubview:self.datePickerStartsss];
    
    self.buttonStartOversss = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonStartOversss.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonStartOversss setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonStartOversss addTarget:self action:@selector(clickStartOver:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateViewsss addSubview:self.buttonStartOversss];
    
    [self bringSubviewToFront:self.dateViewsss];
    
}




- (void)clickStartOver:(UIButton *)button
{
    NSLog(@"完成");
    
    NSDate *currDate = [self.datePickerStartsss date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    self.labelDateStartsss.textColor = [UIColor redColor];
    self.labelDateStartsss.text = [NSString stringWithFormat:@"%@",timeString];
    
    [self sendSubviewToBack:self.dateViewsss];
    
    [self.dateViewsss removeFromSuperview];
    
}




- (void)clickbuttonEnd:(UIButton *)button
{
    
    NSLog(@"end");
    if (self.dateViewsss) {
        [self.dateViewsss removeFromSuperview];
    }
    
    if (self.dateViewEndsss) {
        [self.dateViewEndsss removeFromSuperview];
    }
    
    self.dateViewEndsss = [[UIView alloc]initWithFrame:CGRectMake(0, 150 , 375, 300)];
    
    self.dateViewEndsss.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateViewEndsss];
    NSDate *datee = [NSDate date];
    
    self.datePickerEndsss = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickerEndsss.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickerEndsss.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale1 = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickerEndsss.locale = locale1;
    [self.datePickerEndsss setDate:datee animated:YES];
    [self.dateViewEndsss addSubview:self.datePickerEndsss];
    
    
    
    self.buttonEndOversss = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonEndOversss.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonEndOversss setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonEndOversss addTarget:self action:@selector(clickbuttonED:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateViewEndsss addSubview:self.buttonEndOversss];
    
    
    [self bringSubviewToFront:self.dateViewEndsss];
}



- (void)clickbuttonED:(UIButton *)button
{
    NSLog(@"endOver");
    
    
    NSDate *currDate = [self.datePickerEndsss date];
    // 得到当前的DatePicker的选中的时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    
    self.labelDateEndsss.textColor = [UIColor yellowColor];
    self.labelDateEndsss.text = [NSString stringWithFormat:@"%@",timeString];
    
    [self sendSubviewToBack:self.dateViewEndsss];
    
    [self.dateViewEndsss removeFromSuperview];
    
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
