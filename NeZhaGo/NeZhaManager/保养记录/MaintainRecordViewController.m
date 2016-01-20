
//
//  MaintainRecordViewController.m
//  NeZhaCarss
//
//  Created by cz.jin on 16/1/20.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "MaintainRecordViewController.h"

@interface MaintainRecordViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_dataArray;
}
@end

@implementation MaintainRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"保养记录";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"FFFFFF"]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self createTableView];
}

- (void)createTime
{
    UILabel *fromLabel = [UILabel new];
    UILabel *toLabel = [UILabel new];
    UILabel *lblFromTime = [UILabel new];
    UILabel *lblToTime = [UILabel new];
    
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
    
    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        make.bottom.equalTo(self.headerView.mas_bottom).with.offset(-10);
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

#pragma mark *****创建tableView*****
- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    [self createTime];
    self.headerView.backgroundColor = [UIColor whiteColor];
    
    _tableView.tableHeaderView = self.headerView;
    
    [self.view addSubview:_tableView];
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


-(void)clickLeft:(UIButton*)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
