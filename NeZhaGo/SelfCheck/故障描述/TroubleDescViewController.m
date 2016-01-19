//
//  TroubleDescViewController.m
//  NeZhaCarss
//
//  Created by cz.jin on 16/1/18.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "TroubleDescViewController.h"

@interface TroubleDescViewController ()<UITextViewDelegate>

@end

@implementation TroubleDescViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"故障描述";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"FFFFFF"]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self createTextZone];
    [self createPicZone];
}

#warning 此处添加选择照片方法
- (void)createPicZone
{
    
}

- (void)createTextZone
{
    self.troubleDescTV = [UITextView new];
    self.troubleDescTV.backgroundColor = [UIColor whiteColor];
    self.troubleDescTV.layer.borderColor = [UIColor blackColor].CGColor;
    self.troubleDescTV.layer.borderWidth = 1;
    self.troubleDescTV.delegate =self;
    self.troubleDescTV.text = @"请描述下爱车故障吧...";
    [self.view addSubview:self.troubleDescTV];
    
    [self.troubleDescTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@200);
    }];
}

-(void)clickLeft:(UIButton*)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"请描述下爱车故障吧..."]) {
        textView.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length<1) {
        textView.text = @"请描述下爱车故障吧...";
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    if (![touch.view isKindOfClass: [UITextView class]] || ![touch.view isKindOfClass: [UITextView class]]) {
        
        [self.view endEditing:YES];
        
    }
    
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
