//
//  MapTableViewCell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/7.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "MapTableViewCell.h"
#import "UIColor+Hex.h"

@implementation MapTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creayeCell];
    }
    return self;
}

- (void)creayeCell
{
    self.imageViewBMWB = [UIImageView new];
    [self.contentView addSubview:self.imageViewBMWB];
    
    
    self.labelNumberBmw = [UILabel new];
    [self.contentView addSubview:self.labelNumberBmw];
    self.labelNumberBmw.font = [UIFont systemFontOfSize:11];
    self.labelNumberBmw.textColor = [UIColor colorWithHexString:@"#FEFEFE"];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageViewBMWB.frame =  CGRectMake(0, 5, 30, 30);
    
    self.labelNumberBmw.frame =  CGRectMake(35, 5, 55, 30);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
