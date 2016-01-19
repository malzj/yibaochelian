//
//  LeftSheZhiFirstPageCollectionViewCell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/14.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftSheZhiFirstPageCollectionViewCell.h"

@implementation LeftSheZhiFirstPageCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCell];
    }
    
    
    return self;
    
    
}

- (void)createCell
{
    self.labelKKm = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 30)];
    self.labelKKm.font = [UIFont systemFontOfSize:17];
    self.labelKKm.textColor = [UIColor colorWithWhite:0.515 alpha:1.000];
    self.labelKKm.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.labelKKm];
    
    
        
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
