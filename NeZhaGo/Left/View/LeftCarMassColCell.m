//
//  LeftCarMassColCell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/18.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftCarMassColCell.h"

@implementation LeftCarMassColCell

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
        [self createCol];
        
    }
    
    
    return self;
}





- (void)createCol
{
    self.labeNum = [[UILabel alloc]init];
    self.labeNum.textColor = [UIColor colorWithRed:85/255.0 green:188/255.0 blue:180/255.0 alpha:1];
    self.labeNum.font = [UIFont systemFontOfSize:15];
    self.labeNum.frame = CGRectMake(20, 5, 100, 30);
    [self addSubview:self.labeNum];
    
    
    
    self.labeSize = [UILabel new];
    self.labeSize.font = [UIFont systemFontOfSize:13];
    self.labeSize.frame = CGRectMake(155, 5, 80, 30);
    self.labeSize.textColor = [UIColor colorWithRed:0.485 green:0.487 blue:0.493 alpha:1.000];
    [self addSubview:self.labeSize];
    
    
    self.labeZhongDuan = [[UILabel alloc]init];
    self.labeZhongDuan.textColor = [UIColor colorWithRed:0.485 green:0.487 blue:0.493 alpha:1.000];
    self.labeZhongDuan.frame = CGRectMake(252, 5, 80, 30);
    self.labeZhongDuan.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.labeZhongDuan];
 
}





@end
