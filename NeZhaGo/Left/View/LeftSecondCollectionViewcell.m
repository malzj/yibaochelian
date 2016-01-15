//
//  LeftSecondCollectionViewcell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/8.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftSecondCollectionViewcell.h"

@interface LeftSecondCollectionViewcell ()<UITableViewDelegate,UITableViewDelegate>

@property (nonatomic ,strong)UITableView *tableSearchs;

@end

@implementation LeftSecondCollectionViewcell



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createMainViews];
    }
    
    return self;
}


 - (void)createMainViews
{
    self.viewWhites = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 130)];
    self.viewWhites.backgroundColor = [UIColor whiteColor];
    
    self.labelDateStarts = [[UILabel alloc]initWithFrame:CGRectMake(30, 37, 135, 30)];
    self.labelDateStarts.backgroundColor = [UIColor grayColor];
    self.labelDateStarts.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.labelDateStarts.layer.borderWidth = 1;
    self.labelDateStarts.layer.cornerRadius = 5;
    self.labelDateStarts.layer.masksToBounds = YES;
    self.labelDateStarts.alpha = 0.3;
    [self.viewWhites addSubview:self.labelDateStarts];
    self.labelDateStarts.textAlignment = NSTextAlignmentCenter;
    self.labelDateStarts.textColor = [UIColor grayColor];
    
    self.buttonStarts = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonStarts.backgroundColor = [UIColor clearColor];
    self.buttonStarts.frame = self.labelDateStarts.frame;
    [self.viewWhites addSubview:self.buttonStarts];
    
    
    
    self.labelDateEnds = [[UILabel alloc]initWithFrame:CGRectMake(220, 37, 135, 30)];
    self.labelDateEnds.layer.backgroundColor = [UIColor grayColor].CGColor;
    self.labelDateEnds.layer.borderWidth = 1;
    self.labelDateEnds.layer.cornerRadius = 5;
    self.labelDateEnds.layer.masksToBounds = YES;
    self.labelDateEnds.alpha = 0.3;
    self.labelDateEnds.textAlignment = NSTextAlignmentCenter;
    self.labelDateEnds.textColor = [UIColor grayColor];
    
    
    [self.viewWhites addSubview:self.labelDateEnds];
    
    
    self.buttonEnds = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonEnds.backgroundColor = [UIColor clearColor];
    self.buttonEnds.frame = self.labelDateEnds.frame;
    [self.viewWhites addSubview:self.buttonEnds];
    
    
    [self.buttonEnds addTarget:self action:@selector(clickbuttonEnd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.buttonStarts addTarget:self action:@selector(clickbuttonStart:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelCongs = [[UILabel alloc]initWithFrame:CGRectMake(5, 42, 30, 20)];
    self.labelCongs.textColor = [UIColor grayColor];
    self.labelCongs.font = [UIFont systemFontOfSize:13];
    [self.viewWhites addSubview:self.labelCongs];
    
    self.labelDaos = [[UILabel alloc]initWithFrame:CGRectMake(190, 42, 30, 20)];
    self.labelDaos.textColor = [UIColor grayColor];
    self.labelDaos.font = [UIFont systemFontOfSize:13];
    [self.viewWhites addSubview:self.labelDaos];
    
    
    
    self.buttonSearchs =[UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonSearchs setTitle:@"搜索" forState:UIControlStateNormal];
    self.buttonSearchs.frame = CGRectMake(5, 80, 365, 40);
    self.buttonSearchs.backgroundColor = [UIColor colorWithRed:254/255.0 green:167/255.0 blue:50/255.0 alpha:1];
    [self.buttonSearchs setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.viewWhites addSubview:self.buttonSearchs];
    
    [self.buttonSearchs addTarget:self action:@selector(clickSearchs:) forControlEvents:UIControlEventTouchUpInside];

}





- (UITableView *)tableSearchs
{
    if (!_tableSearchs) {
        
        _tableSearchs = [[UITableView alloc]initWithFrame:CGRectMake(0, 160, 375, 300) style:UITableViewStylePlain];
        
    }
    return _tableSearchs;
}




- (void)clickSearchs:(UIButton *)button
{
    NSLog(@"se");
    
//    self.tableSearchs.backgroundColor = [UIColor redColor];
    [self addSubview:self.tableSearchs];
    _tableSearchs.dataSource = self;
    _tableSearchs.delegate = self;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseded = @"reuseded";
    UITableViewCell *celledd = [tableView dequeueReusableCellWithIdentifier:reuseded];
    if (!celledd) {
        celledd = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseded];
    }
    
    
    
    
    return celledd;
}




#warning ------日期
- (void)clickbuttonStart:(UIButton *)button
{
    if (self.dateViews) {
        [self.dateViews removeFromSuperview];
    }
    
    if (self.dateViewEnds) {
        [self.dateViewEnds removeFromSuperview];
    }
    
    NSDate *date = [NSDate date];
    NSLog(@"start");
    self.dateViews = [[UIView alloc] initWithFrame:CGRectMake(0, 150 , 375, 300)];
    self.dateViews.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateViews];
    
    self.datePickerStarts = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickerStarts.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickerStarts.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickerStarts.locale = locale;
    [self.datePickerStarts setDate:date animated:YES];
    [self.dateViews addSubview:self.datePickerStarts];
    
    self.buttonStartOvers = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonStartOvers.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonStartOvers setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonStartOvers addTarget:self action:@selector(clickStartOver:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateViews addSubview:self.buttonStartOvers];
    
    [self bringSubviewToFront:self.dateViews];
    
}
























- (void)clickStartOver:(UIButton *)button
{
    NSLog(@"完成");
    
    NSDate *currDate = [self.datePickerStarts date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    self.labelDateStarts.textColor = [UIColor redColor];
    self.labelDateStarts.text = [NSString stringWithFormat:@"%@",timeString];
    
    [self sendSubviewToBack:self.dateViews];
    
    [self.dateViews removeFromSuperview];
    
}




- (void)clickbuttonEnd:(UIButton *)button
{
    
    NSLog(@"end");
    if (self.dateViews) {
        [self.dateViews removeFromSuperview];
    }
    
    if (self.dateViewEnds) {
        [self.dateViewEnds removeFromSuperview];
    }
    
    self.dateViewEnds = [[UIView alloc]initWithFrame:CGRectMake(0, 150 , 375, 300)];
    
    self.dateViewEnds.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateViewEnds];
    NSDate *datee = [NSDate date];
    
    self.datePickerEnds = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickerEnds.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickerEnds.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale1 = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickerEnds.locale = locale1;
    [self.datePickerEnds setDate:datee animated:YES];
    [self.dateViewEnds addSubview:self.datePickerEnds];
    
    
    
    self.buttonEndOvers = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonEndOvers.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonEndOvers setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonEndOvers addTarget:self action:@selector(clickbuttonED:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateViewEnds addSubview:self.buttonEndOvers];
    
    
    [self bringSubviewToFront:self.dateViewEnds];
}



- (void)clickbuttonED:(UIButton *)button
{
    NSLog(@"endOver");
    
    
    NSDate *currDate = [self.datePickerEnds date];
    // 得到当前的DatePicker的选中的时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    
    self.labelDateEnds.textColor = [UIColor yellowColor];
    self.labelDateEnds.text = [NSString stringWithFormat:@"%@",timeString];
    
    [self sendSubviewToBack:self.dateViewEnds];
    
    [self.dateViewEnds removeFromSuperview];
    
    
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
