//
//  LeftTableViewCell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/6.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftTableViewCell.h"
#import "UIColor+Hex.h"
#import "JumpPage.h"

@interface LeftTableViewCell ()<UISearchBarDelegate>

@end


@implementation LeftTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createLeftCell];
    }
    
    return self;
}
- (void)createLeftCell
{
    self.searchCar = [[UISearchBar alloc]init];
    self.searchCar.delegate = self;
    self.searchCar.layer.cornerRadius = 5;
    self.searchCar.layer.masksToBounds = YES;
    self.searchCar.layer.borderWidth = 0.1;
    self.searchCar.barTintColor = [UIColor colorWithRed:36/255.0 green:42/255.0 blue:49/255.0 alpha:0.1];
    self.searchCar.placeholder = @"搜索车辆";
    self.imagePicture = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imagePicture];
    self.labelCarNumber = [[UILabel alloc]init];
    [self.contentView addSubview:self.labelCarNumber];
    self.labelCarNumber.font = [UIFont systemFontOfSize:19];
    self.labelCarNumber.textColor = [UIColor whiteColor];
    self.imageViewOnlines = [UIImageView new];
    [self.contentView addSubview:self.imageViewOnlines];
    self.imageViewBackPicture = [UIImageView new];
    [self.contentView addSubview:self.imageViewBackPicture];
}
- (void)layoutSubviews
{
    [super layoutSubviews];

    
    self.searchCar.frame = CGRectMake(10, 7, self.contentView.bounds.size.width-20, 30);
    
    
    self.imagePicture.frame = CGRectMake(5, 5, 40, 40);
    self.imageViewOnlines.frame = CGRectMake(200, 15, 48, 25);
    self.imageViewBackPicture.frame = CGRectMake(200, 15, 48, 25);
    self.labelCarNumber.frame = CGRectMake(50, 15, 100, 20);


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
