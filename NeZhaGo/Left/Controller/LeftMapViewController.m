//
//  LeftMapViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/11.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftMapViewController.h"

@interface LeftMapViewController ()
@property (nonatomic ,strong)UILabel *LabelTitle;
@end

@implementation LeftMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.LabelTitle = [UILabel new];
    self.LabelTitle.text = @"离线地图";
    self.LabelTitle.font = [UIFont systemFontOfSize:18];
    self.LabelTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self.LabelTitle sizeToFit];
    self.navigationItem.titleView = self.LabelTitle;
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconfont-gmfanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)]; 
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
