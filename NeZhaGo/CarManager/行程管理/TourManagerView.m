//
//  TourManagerView.m
//  Nezha
//
//  Created by cz.jin on 15/11/19.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "TourManagerView.h"
#import "Masonry.h"
#import "UIColor+Hex.h"

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;

@implementation TourManagerView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        [self createTableView];
    }
    return self;
}

- (void)createUI
{
    self.bgView = [UIView new];
    //bgView.frame = CGRectMake(0, 0, 20, 20);
//    self.bgView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0" alpha:1];
    [self addSubview:self.bgView];
    
    WS(ws);
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws);
        make.left.equalTo(ws);
        make.right.equalTo(ws);
        make.bottom.equalTo(ws);
    }];
}

#pragma mark *****创建tableView*****
- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bgView.frame.size.width, self.bgView.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    
    //NSLog(@"%lf", self.bgView.frame.size.width);
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bgView.frame.size.width, 165)];
    [self createHeaderView];
    [self createHeaderDetailView];
    self.headerView.backgroundColor = [UIColor whiteColor];
    
    _tableView.tableHeaderView = self.headerView;
    [self.bgView addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgView);
        make.size.equalTo(self.bgView);
    }];
}

- (void)createHeaderDetailView
{
    UIImageView *totalMileView = [UIImageView new];
    UIImageView *totalOilView = [UIImageView new];
    UIImageView *totalTimeView = [UIImageView new];
    UIImageView *alarmCountView = [UIImageView new];
    UIImageView *averOilView = [UIImageView new];
    UIImageView *averspeedView = [UIImageView new];
    
    totalMileView.image = [UIImage imageNamed:@"总里程图标.png"];
    totalOilView.image = [UIImage imageNamed:@"总油耗图标.png"];
    totalTimeView.image = [UIImage imageNamed:@"总时长图标.png"];
    alarmCountView.image = [UIImage imageNamed:@"报警累计图标.png"];
    averOilView.image = [UIImage imageNamed:@"平均油耗图标.png"];
    averspeedView.image = [UIImage imageNamed:@"平均时速图标.png"];
    
    [self.headerView addSubview:totalMileView];
    [self.headerView addSubview:totalOilView];
    [self.headerView addSubview:totalTimeView];
    [self.headerView addSubview:alarmCountView];
    [self.headerView addSubview:averOilView];
    [self.headerView addSubview:averspeedView];
    
    [totalMileView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).with.offset(15);
        make.left.equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    
    [totalOilView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalMileView.mas_right).with.offset(89);
        make.size.mas_equalTo(totalMileView);
        make.top.equalTo(totalMileView);
    }];
    
    [totalTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-74);
        make.size.mas_equalTo(totalMileView);
        make.centerY.mas_equalTo(totalMileView);
    }];
    
    [alarmCountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(totalMileView);
        make.size.mas_equalTo(totalMileView);
        make.top.equalTo(totalMileView.mas_bottom).with.offset(15);
    }];
    
    [averOilView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(alarmCountView);
        make.size.mas_equalTo(totalMileView);
        make.centerX.mas_equalTo(totalOilView);
    }];
    
    [averspeedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(alarmCountView);
        make.size.mas_equalTo(totalMileView);
        make.centerX.mas_equalTo(totalTimeView);
    }];
    
    UILabel *totalMileNameLabel = [UILabel new];
    UILabel *totalOilNameLabel = [UILabel new];
    UILabel *totalTimeNameLabel = [UILabel new];
    UILabel *alarmCountNameLabel = [UILabel new];
    UILabel *averOilNameLabel = [UILabel new];
    UILabel *averSpeedNameLabel = [UILabel new];
    
    totalMileNameLabel.text = @"总里程";
    totalMileNameLabel.font = [UIFont systemFontOfSize:15];
    totalMileNameLabel.textColor = [UIColor colorWithHexString:@"#444444"];
    totalOilNameLabel.text = @"总油耗";
    totalOilNameLabel.font = [UIFont systemFontOfSize:15];
    totalOilNameLabel.textColor = [UIColor colorWithHexString:@"#444444"];
    totalTimeNameLabel.text = @"总时长";
    totalTimeNameLabel.font = [UIFont systemFontOfSize:15];
    totalTimeNameLabel.textColor = [UIColor colorWithHexString:@"#444444"];
    alarmCountNameLabel.text = @"报警累计";
    alarmCountNameLabel.font = [UIFont systemFontOfSize:15];
    alarmCountNameLabel.textColor = [UIColor colorWithHexString:@"#444444"];
    averOilNameLabel.text = @"平均油耗";
    averOilNameLabel.font = [UIFont systemFontOfSize:15];
    averOilNameLabel.textColor = [UIColor colorWithHexString:@"#444444"];
    averSpeedNameLabel.text = @"平均时速";
    averSpeedNameLabel.font = [UIFont systemFontOfSize:15];
    averSpeedNameLabel.textColor = [UIColor colorWithHexString:@"#444444"];
    
    [self.headerView addSubview:totalMileNameLabel];
    [self.headerView addSubview:totalOilNameLabel];
    [self.headerView addSubview:totalTimeNameLabel];
    [self.headerView addSubview:alarmCountNameLabel];
    [self.headerView addSubview:averOilNameLabel];
    [self.headerView addSubview:averSpeedNameLabel];
    
    [totalMileNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(totalMileView);
        make.left.equalTo(totalMileView.mas_right).with.offset(5);
        make.right.equalTo(totalOilView.mas_left).with.offset(-5);
        make.height.equalTo(@15);
    }];
    
    [totalOilNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(totalOilView);
        make.left.equalTo(totalOilView.mas_right).with.offset(5);
        make.right.equalTo(totalTimeView.mas_left).with.offset(-5);
        make.height.equalTo(@15);
    }];
    
    [totalTimeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(totalTimeView);
        make.left.equalTo(totalTimeView.mas_right).with.offset(5);
        make.right.equalTo(self.headerView).with.offset(-5);
        make.height.equalTo(@15);
    }];
    
    [alarmCountNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alarmCountView);
        make.left.equalTo(alarmCountView.mas_right).with.offset(5);
        make.right.equalTo(averOilView.mas_left).with.offset(-5);
        make.height.equalTo(@15);
    }];
    
    [averOilNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(averOilView);
        make.left.equalTo(averOilView.mas_right).with.offset(5);
        make.right.equalTo(averspeedView.mas_left).with.offset(-5);
        make.height.equalTo(@15);
    }];
    
    [averSpeedNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(averspeedView);
        make.left.equalTo(averspeedView.mas_right).with.offset(5);
        make.right.equalTo(self.headerView).with.offset(-5);
        make.height.equalTo(@15);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#e8e8e8"];
    [self.headerView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.headerView);
        make.height.equalTo(@1);
        make.left.equalTo(@0);
        make.bottom.equalTo(self.headerView.mas_bottom);
    }];
}

- (void)createHeaderView
{
    UILabel *fromLabel = [UILabel new];
    UILabel *toLabel = [UILabel new];
    UILabel *lblFromTime = [UILabel new];
    UILabel *lblToTime = [UILabel new];
    self.lineView = [UIView new];
    
    fromLabel.text = @"从:";
    toLabel.text = @"至:";
    lblFromTime.text = @" 2015-12-01 10:59";
    lblToTime.text = @" 2015-12-01 11:00";
    
    fromLabel.numberOfLines = 0;
    
    fromLabel.font = [UIFont systemFontOfSize:13];
    toLabel.font = [UIFont systemFontOfSize:13];
    lblFromTime.font = [UIFont systemFontOfSize:12];
    lblToTime.font = [UIFont systemFontOfSize:12];
    
    lblFromTime.backgroundColor = [UIColor colorWithHexString:@"#e6e6e8"];
    lblToTime.backgroundColor = [UIColor colorWithHexString:@"#e6e6e8"];
    self.lineView.backgroundColor = [UIColor colorWithHexString:@"e8e8e8"];
    
    lblFromTime.layer.borderColor = [[UIColor colorWithHexString:@"#999999"] CGColor];
    lblToTime.layer.borderColor = [[UIColor colorWithHexString:@"#999999"] CGColor];
    
    fromLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    toLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    lblFromTime.textColor = [UIColor colorWithHexString:@"#666666"];
    lblToTime.textColor = [UIColor colorWithHexString:@"#666666"];
    
    lblFromTime.layer.cornerRadius = 2;
    lblFromTime.layer.masksToBounds = YES;
    lblToTime.layer.cornerRadius = 2;
    lblToTime.layer.masksToBounds = YES;
    
//    CGSize labelsize = [fromLabel.text sizeWithFont:fromLabel.font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    //NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    //设置段落模式
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13], NSParagraphStyleAttributeName: paragraph};
    
    CGSize size = [fromLabel.text boundingRectWithSize:CGSizeMake(100, 0)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:attribute
                                               context:nil].size;
    
    [self.headerView addSubview:fromLabel];
    [self.headerView addSubview:toLabel];
    [self.headerView addSubview:lblFromTime];
    [self.headerView addSubview:lblToTime];
    [self.headerView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.headerView);
        make.height.equalTo(@1);
        make.top.equalTo(@45);
        make.left.equalTo(@0);
    }];
    
    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        make.bottom.equalTo(self.lineView.mas_top).with.offset(-10);
        make.width.mas_equalTo(size.width);
    }];
    
    [toLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fromLabel);
        make.left.equalTo(lblFromTime.mas_right).with.offset(10);
        make.right.equalTo(lblToTime.mas_left).with.offset(-10);
        make.size.mas_equalTo(fromLabel);
    }];
    
    [lblFromTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fromLabel);
        make.left.equalTo(fromLabel.mas_right).with.offset(10);
        make.bottom.equalTo(fromLabel);
        make.right.equalTo(toLabel.mas_left).with.offset(-10);
    }];
    
    [lblToTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fromLabel);
        make.left.equalTo(toLabel.mas_right).with.offset(10);
        make.right.equalTo(@-10);
        make.size.mas_equalTo(lblFromTime);
    }];
}

#pragma mark *****UITableViewDelegate*****
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    
    //读取数据源
    cell.textLabel.text = @"test";
    cell.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
