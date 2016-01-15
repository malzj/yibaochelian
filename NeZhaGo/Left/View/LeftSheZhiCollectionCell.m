//
//  LeftSheZhiCollectionCell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/14.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftSheZhiCollectionCell.h"
#import "LeftSheZhiFirstPageCollectionViewCell.h"

@interface LeftSheZhiCollectionCell ()<UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong)NSMutableArray *arrLose;

@property (nonatomic ,strong)UICollectionViewFlowLayout *flowss;


@property (nonatomic ,strong)UIButton *buttonTianJia;
@end

@implementation LeftSheZhiCollectionCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createST];
    }
    
    
    return self;
}


- (void)createST
{
    
    self.arrLose = [NSMutableArray arrayWithObjects:@"5000Km",@"10000Km",@"15000Km",@"20000Km",@"25000Km",@"30000Km",@"35000Km",@"4000Km", nil];

    
    
    self.viewSmall = [[UIView alloc]initWithFrame:CGRectMake(0, 30, 375, 180)];
    [self addSubview:self.viewSmall];
    self.viewSmall.backgroundColor = [UIColor whiteColor];
    
    self.labelTuiJian = [[UILabel alloc]initWithFrame:CGRectMake(0, 220, 375, 40)];
    self.labelTuiJian.backgroundColor = [UIColor colorWithRed:0/255.0 green:216/255.0 blue:197/255.0 alpha:1];
    self.labelTuiJian.textColor = [UIColor whiteColor];
    self.labelTuiJian.textAlignment = NSTextAlignmentCenter;
    self.labelTuiJian.text = @"保养项目推荐";
    [self addSubview:self.labelTuiJian];
    
    
    
    self.labelBaoYangLiCheng = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 100, 30)];
    self.labelBaoYangLiCheng.textColor = [UIColor colorWithWhite:0.238 alpha:1.000];
    self.labelBaoYangLiCheng.text = @"保养里程间隔 :";
    self.labelBaoYangLiCheng.font = [UIFont systemFontOfSize:15];
    [self.viewSmall addSubview:self.labelBaoYangLiCheng];
 
    self.viewLineOne = [[UIView alloc]initWithFrame:CGRectMake(5, 45, 365, 1)];
    self.viewLineOne.backgroundColor = [UIColor colorWithWhite:0.581 alpha:0.600];
    [self.viewSmall addSubview:self.viewLineOne];
    
    
    
    
    
    self.labelBaoYangShiJian = [[UILabel alloc]initWithFrame:CGRectMake(15, 50, 100, 30)];
    self.labelBaoYangShiJian.textColor = [UIColor colorWithWhite:0.238 alpha:1.000];
    self.labelBaoYangShiJian.text = @"保养时间间隔 :";
    self.labelBaoYangShiJian.font = [UIFont systemFontOfSize:15];
    [self.viewSmall addSubview:self.labelBaoYangShiJian];
    
    self.viewLineTwo = [[UIView alloc]initWithFrame:CGRectMake(5, 90, 365, 1)];
    self.viewLineTwo.backgroundColor = [UIColor colorWithWhite:0.581 alpha:0.600];
    [self.viewSmall addSubview:self.viewLineTwo];
    
    
    
    
    
    
    self.labelLast = [[UILabel alloc]initWithFrame:CGRectMake(15, 95, 100, 30)];
    self.labelLast.textColor = [UIColor colorWithWhite:0.238 alpha:1.000];
    self.labelLast.text = @"上次保养里程 :";
    self.labelLast.font = [UIFont systemFontOfSize:15];
    [self.viewSmall addSubview:self.labelLast];
    
    self.viewLineThree = [[UIView alloc]initWithFrame:CGRectMake(5, 135, 365, 1)];
    self.viewLineThree.backgroundColor = [UIColor colorWithWhite:0.581 alpha:0.600];
    [self.viewSmall addSubview:self.viewLineThree];

    
    self.labelLastTime = [[UILabel alloc]initWithFrame:CGRectMake(15, 140, 100, 30)];
    self.labelLastTime.textColor = [UIColor colorWithWhite:0.238 alpha:1.000];
    self.labelLastTime.text = @"上次保养时间 :";
    self.labelLastTime.font = [UIFont systemFontOfSize:15];
    [self.viewSmall addSubview:self.labelLastTime];
    

//    self.viewLinefour = [[UIView alloc]initWithFrame:CGRectMake(5, 180, 365, 1)];
//    self.viewLinefour.backgroundColor = [UIColor colorWithWhite:0.581 alpha:0.600];
//    [self.viewSmall addSubview:self.viewLinefour];

    
    self.textFieldFirst = [[UITextField alloc]initWithFrame:CGRectMake(125, 5, 205, 30)];
    self.textFieldFirst.delegate = self;
    self.textFieldFirst.layer.borderWidth = 1;
    self.textFieldFirst.backgroundColor = [UIColor whiteColor];
    self.textFieldFirst.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
     [self.viewSmall addSubview:self.textFieldFirst];
    
    
    
    
    self.textFieldSecond = [[UITextField alloc]initWithFrame:CGRectMake(125, 50, 205, 30)];
    self.textFieldSecond.delegate = self;
    self.textFieldSecond.layer.borderWidth = 1;
    self.textFieldSecond.backgroundColor = [UIColor whiteColor];
    self.textFieldSecond.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.viewSmall addSubview:self.textFieldSecond];

    
    
    
    self.textFieldThird = [[UITextField alloc]initWithFrame:CGRectMake(125, 95, 205, 30)];
    self.textFieldThird.delegate = self;
    self.textFieldThird.layer.borderWidth = 1;
    self.textFieldThird.backgroundColor = [UIColor whiteColor];
    self.textFieldThird.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.viewSmall addSubview:self.textFieldThird];
    
    
    
    
    
    self.buttonDate = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonDate.frame = CGRectMake(125, 140, 205, 30);
    self.buttonDate.layer.borderWidth = 1;
    self.buttonDate.backgroundColor = [UIColor whiteColor];
    self.buttonDate.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;
    [self.buttonDate addTarget:self action:@selector(clickDate:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewSmall addSubview:self.buttonDate];

    
    self.flowss = [[UICollectionViewFlowLayout alloc]init];
    self.flowss.itemSize = CGSizeMake(150, 30);
    
    self.collectionViewKM = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 270, 375,160 ) collectionViewLayout:self.flowss];
    //self.collectionViewKM.backgroundColor = [UIColor redColor]
    
    _collectionViewKM.showsHorizontalScrollIndicator = NO;
    _collectionViewKM.showsVerticalScrollIndicator = NO;
    _collectionViewKM.pagingEnabled = YES;
    _collectionViewKM.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    self.collectionViewKM.dataSource = self;
    _collectionViewKM.bounces = NO;
    self.collectionViewKM.delegate = self;
    [self addSubview:self.collectionViewKM];
    [self.collectionViewKM registerClass:[LeftSheZhiFirstPageCollectionViewCell class] forCellWithReuseIdentifier:@"runRease"];
    
    
    
    self.buttonTianJia = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonTianJia.frame = CGRectMake(30, 445, 315, 30);
    self.buttonTianJia.backgroundColor = [UIColor whiteColor];
    [self.buttonTianJia setTitleColor:[UIColor colorWithWhite:0.515 alpha:1.000] forState:UIControlStateNormal];
    
    [self.buttonTianJia setTitle:@"添加保养提醒" forState:UIControlStateNormal];
    [self.buttonTianJia addTarget:self action:@selector(clickButtonTianJia:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonTianJia];


    
}

- (void)clickButtonTianJia:(UIButton *)button
{
    NSLog(@"ddd");
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrLose.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LeftSheZhiFirstPageCollectionViewCell *flCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"runRease" forIndexPath:indexPath];
    
    flCell.labelKKm.text = self.arrLose[indexPath.row];
    flCell.backgroundColor = [UIColor whiteColor];
  
  
    
    return flCell;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 30, 10, 30);
}


- (void)clickDate:(UIButton *)button
{
    if (self.dateViews) {
        [self.dateViews removeFromSuperview];
    }
    
    NSDate *date = [NSDate date];
    
    self.dateViews = [[UIView alloc] initWithFrame:CGRectMake(0, 150 , 375, 300)];
    self.dateViews.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.dateViews];

    
    
    self.datePickers = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 50, 375, 200)];
    self.datePickers.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.datePickers.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.datePickers.locale = locale;
    [self.datePickers setDate:date animated:YES];
    [self.dateViews addSubview:self.datePickers];
    
    self.buttonnOver = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonnOver.frame = CGRectMake(280, 30, 70, 30);
    [self.buttonnOver setTitle:@"over" forState:UIControlStateNormal];
    [self.buttonnOver addTarget:self action:@selector(clickStartOver:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateViews addSubview:self.buttonnOver];

    
    
    
}

- (void)clickStartOver:(UIButton *)button
{
    NSLog(@"over");
    
    NSDate *currDate = [self.datePickers date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd";
    
    NSString *timeString = [dateFormatter stringFromDate:currDate];
    [self.buttonDate setTitleColor:[UIColor colorWithWhite:0.722 alpha:1.000]forState:UIControlStateNormal];
    [self.buttonDate setTitle:[NSString stringWithFormat:@"%@",timeString] forState:UIControlStateNormal];
    
    [self sendSubviewToBack:self.dateViews];
    
    [self.dateViews removeFromSuperview];

}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.textFieldFirst) {
        if (string.length == 0)
            return YES;
        
        NSInteger existedLength = self.textFieldFirst.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 5) {
            return NO;
        }
        return YES;
    }else if (textField == self.textFieldSecond) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = self.textFieldSecond.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 2) {
            return NO;
        }
    
    return YES;
    }else  {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = self.textFieldThird.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 5) {
            return NO;
        }
        return YES;
    }
 }

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textFieldFirst resignFirstResponder];
    [_textFieldSecond resignFirstResponder];
    [_textFieldThird resignFirstResponder];
}





@end
