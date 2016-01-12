//
//  RecordView.m
//  Nezha
//
//  Created by cz.jin on 15/11/19.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "RecordView.h"

@implementation RecordView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    UIView *bgView = [UIView new];
    bgView.frame = CGRectMake(0, 0, 20, 20);
    bgView.backgroundColor = [UIColor redColor];
    [self addSubview:bgView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
