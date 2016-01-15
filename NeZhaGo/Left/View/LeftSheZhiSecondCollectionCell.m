//
//  LeftSheZhiSecondCollectionCell.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/14.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftSheZhiSecondCollectionCell.h"

@interface LeftSheZhiSecondCollectionCell ()<UITextFieldDelegate>




@end

@implementation LeftSheZhiSecondCollectionCell
{
    NSInteger length;
}
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
        [self createStart];
    }
    
    
    return self;
}

- (void)createStart
{
    
        
    
    _viewBiger = [[UIView alloc]initWithFrame:CGRectMake(0, 30, 375, 465)];
    _viewBiger.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.viewBiger];
    
    _buttonOBD = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonOBD.backgroundColor = [UIColor colorWithRed:0/255.0 green:216/255.0 blue:198/255.0 alpha:1];
    _buttonOBD.frame = CGRectMake(0, 0, 375, 45);
    [self.viewBiger addSubview:self.buttonOBD];
    [self.buttonOBD addTarget:self action:@selector(clickOBD:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonOBD setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonOBD setTitle:@"OBD参数" forState:UIControlStateNormal];
    self.buttonOBD.titleLabel.font = [UIFont systemFontOfSize:19];
    
    _buttonWeiLan = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonWeiLan.frame = CGRectMake(45, 55, 40, 40);
    _buttonWeiLan.backgroundColor = [UIColor orangeColor];
    [self.viewBiger addSubview:self.buttonWeiLan];
    [self.buttonWeiLan addTarget:self action:@selector(clickWeiLan:) forControlEvents:UIControlEventTouchUpInside];
    _labelWeiLan = [[UILabel alloc]initWithFrame:CGRectMake(43, 90, 50, 40)];
    //_labelWeiLan.textAlignment = NSTextAlignmentCenter;
    _labelWeiLan.textColor = [UIColor grayColor];
    _labelWeiLan.text = @"创建围栏";
    _labelWeiLan.font = [UIFont systemFontOfSize:11];
    [self.viewBiger addSubview:self.labelWeiLan];
    
    
    _buttonChaKanWeiLan = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonChaKanWeiLan.frame = CGRectMake(125, 55, 40, 40);
    _buttonChaKanWeiLan.backgroundColor = [UIColor greenColor];
    [self.viewBiger addSubview:self.buttonChaKanWeiLan];
    [self.buttonChaKanWeiLan addTarget:self action:@selector(clickChaKanWeiLan:) forControlEvents:UIControlEventTouchUpInside];
    _labelChaKanWeiLan = [[UILabel alloc]initWithFrame:CGRectMake(123, 90, 50, 40)];
    //_labelWeiLan.textAlignment = NSTextAlignmentCenter;
    _labelChaKanWeiLan.textColor = [UIColor grayColor];
    _labelChaKanWeiLan.text = @"查看围栏";
    _labelChaKanWeiLan.font = [UIFont systemFontOfSize:11];
    [self.viewBiger addSubview:self.labelChaKanWeiLan];
    
    _buttonXianLu = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonXianLu.frame = CGRectMake(205, 55, 40, 40);
    _buttonXianLu.backgroundColor = [UIColor colorWithRed:1.000 green:0.627 blue:0.893 alpha:1.000];
    [self.viewBiger addSubview:_buttonXianLu];
    [self.buttonXianLu addTarget:self action:@selector(clickXianLu:) forControlEvents:UIControlEventTouchUpInside];
    
    _labelXianLu = [[UILabel alloc]initWithFrame:CGRectMake(203, 90, 50, 40)];
    //_labelWeiLan.textAlignment = NSTextAlignmentCenter;
    _labelXianLu.textColor = [UIColor grayColor];
    _labelXianLu.text = @"创建线路";
    _labelXianLu.font = [UIFont systemFontOfSize:11];
    [self.viewBiger addSubview:_labelXianLu];
    
    
    _buttonChaKanXianLu = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonChaKanXianLu.frame = CGRectMake(285, 55, 40, 40);
    _buttonChaKanXianLu.backgroundColor = [UIColor colorWithRed:0.415 green:0.668 blue:1.000 alpha:1.000];
    [self.viewBiger addSubview:_buttonChaKanXianLu];
    [self.buttonChaKanXianLu addTarget:self action:@selector(clickChaKanXianLu:) forControlEvents:UIControlEventTouchUpInside];
    _labelChaKanXianLu = [[UILabel alloc]initWithFrame:CGRectMake(283, 90, 50, 40)];
    //_labelWeiLan.textAlignment = NSTextAlignmentCenter;
    _labelChaKanXianLu.textColor = [UIColor grayColor];
    _labelChaKanXianLu.text = @"查看线路";
    _labelChaKanXianLu.font = [UIFont systemFontOfSize:11];
    [self.viewBiger addSubview:_labelChaKanXianLu];
    
    _viewFirst = [[UIView alloc]initWithFrame:CGRectMake(0, 125, 375, 1)];
    _viewFirst.backgroundColor = [UIColor colorWithWhite:0.581 alpha:0.600];
    [self.viewBiger addSubview:_viewFirst];
    
    _labelFast = [[UILabel alloc]initWithFrame:CGRectMake(5, 130, 95, 40)];
    _labelFast.text = @"速度限制";
    _labelFast.font = [UIFont systemFontOfSize:15];
    _labelFast.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    [self.viewBiger addSubview:self.labelFast];
    
    
    _textFieldKm = [[UITextField alloc]initWithFrame:CGRectMake(200, 133, 150, 30)];
    [self.viewBiger addSubview:self.textFieldKm];
    _textFieldKm.layer.borderWidth = 1;
    _textFieldKm.backgroundColor = [UIColor whiteColor];
    _textFieldKm.layer.borderColor = [UIColor colorWithWhite:0.722 alpha:1.000].CGColor;

    _textFieldKm.delegate = self;
    
    _labelKM = [[UILabel alloc]initWithFrame:CGRectMake(110, 0, 40, 30)];
    _labelKM.text = @"KM";
    _labelKM.font = [UIFont systemFontOfSize:14];
    _labelKM.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];

    [self.textFieldKm addSubview:self.labelKM];
    
    _viewSecond = [[UIView alloc]initWithFrame:CGRectMake(5, 170, 365, 1)];
    _viewSecond.backgroundColor =  [UIColor colorWithWhite:0.581 alpha:0.3];
    [self.viewBiger addSubview:_viewSecond];
    
    _labelChaoSu = [[UILabel alloc]initWithFrame:CGRectMake(5, 175, 95, 40)];
    _labelChaoSu.text = @"超速警报";
    _labelChaoSu.font = [UIFont systemFontOfSize:15];
    _labelChaoSu.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    [self.viewBiger addSubview:self.labelChaoSu];
    
    _viewThird = [[UIView alloc]initWithFrame:CGRectMake(5, 220, 365, 1)];
    _viewThird.backgroundColor = [UIColor colorWithWhite:0.581 alpha:0.3];
    [self.viewBiger addSubview:_viewThird];
    
    _labelXianLu = [[UILabel alloc]initWithFrame:CGRectMake(5, 225, 95, 40)];
    _labelXianLu.text = @"线路报警";
    _labelXianLu.font = [UIFont systemFontOfSize:15];
    _labelXianLu.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    [self.viewBiger addSubview:self.labelXianLu];
       _viewFouth = [[UIView alloc]initWithFrame:CGRectMake(5, 270, 365, 1)];
    _viewFouth.backgroundColor =  [UIColor colorWithWhite:0.581 alpha:0.3];
    [self.viewBiger addSubview:_viewFouth];
    
    _buttonXianLuKaiGuan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonXianLuKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    _buttonXianLuKaiGuan.frame = CGRectMake(300, 225, 40, 40);
    [self.buttonXianLuKaiGuan addTarget:self action:@selector(clickXianLuKaiGuan:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewBiger addSubview:self.buttonXianLuKaiGuan];
    
    _labelWeiLan = [[UILabel alloc]initWithFrame:CGRectMake(5, 275, 95, 40)];
    _labelWeiLan.text = @"围栏报警";
    _labelWeiLan.font = [UIFont systemFontOfSize:15];
    _labelWeiLan.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    [self.viewBiger addSubview:self.labelWeiLan];
    _viewFifth = [[UIView alloc]initWithFrame:CGRectMake(5, 320, 365, 1)];
    _viewFifth.backgroundColor =  [UIColor colorWithWhite:0.581 alpha:0.3];
    [self.viewBiger addSubview:_viewFifth];
    
    _buttonWeiLanKaiGuan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonWeiLanKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    self.buttonWeiLanKaiGuan.frame = CGRectMake(300, 275, 40, 40);
    [self.buttonWeiLanKaiGuan addTarget:self action:@selector(clickWeiLanKaiGuan:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewBiger addSubview:self.buttonWeiLanKaiGuan];
    
    _labelDianHuoBaoJing = [[UILabel alloc]initWithFrame:CGRectMake(5, 325, 95, 40)];
    _labelDianHuoBaoJing.text = @"点火报警";
    _labelDianHuoBaoJing.font = [UIFont systemFontOfSize:15];
    _labelDianHuoBaoJing.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    [self.viewBiger addSubview:self.labelDianHuoBaoJing];
    _viewSix = [[UIView alloc]initWithFrame:CGRectMake(5, 370, 365, 1)];
    _viewSix.backgroundColor =  [UIColor colorWithWhite:0.581 alpha:0.3];
    [self.viewBiger addSubview:_viewSix];
    
    _buttonDianHuoKaiGuan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonDianHuoKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    self.buttonDianHuoKaiGuan.frame = CGRectMake(300, 325, 40, 40);
    [self.buttonDianHuoKaiGuan addTarget:self action:@selector(clickDianHuoKaiGuan:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewBiger addSubview:self.buttonDianHuoKaiGuan];

    _labelXiHuoBaoJing = [[UILabel alloc]initWithFrame:CGRectMake(5, 375, 95, 40)];
    _labelXiHuoBaoJing.text = @"熄火报警";
    _labelXiHuoBaoJing.font = [UIFont systemFontOfSize:15];
    _labelXiHuoBaoJing.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    [self.viewBiger addSubview:self.labelXiHuoBaoJing];
    _viewSeven = [[UIView alloc]initWithFrame:CGRectMake(5, 420, 365, 1)];
    _viewSeven.backgroundColor =  [UIColor colorWithWhite:0.581 alpha:0.3];
    [self.viewBiger addSubview:_viewSeven];
    
    _buttonXihuoKaiGuan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonXihuoKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    self.buttonXihuoKaiGuan.frame = CGRectMake(300, 375, 40, 40);
    [self.buttonXihuoKaiGuan addTarget:self action:@selector(clickXiHuoKaiGuan:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewBiger addSubview:self.buttonXihuoKaiGuan];

    _buttonFastKaiGuan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonFastKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    _buttonFastKaiGuan.frame = CGRectMake(300, 175, 40, 40);
    [self.buttonFastKaiGuan addTarget:self action:@selector(clickFastKaiGuan:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewBiger addSubview:self.buttonFastKaiGuan];
    
    _labelUpDate = [[UILabel alloc]initWithFrame:CGRectMake(5, 425, 95, 40)];
    _labelUpDate.text = @"更新频率";
    _labelUpDate.font = [UIFont systemFontOfSize:15];
    _labelUpDate.textColor = [UIColor colorWithRed:118/255.0 green:118/255.0 blue:118/255.0 alpha:1];
    [self.viewBiger addSubview:self.labelUpDate];
    
    
    
    self.slider = [[UISlider alloc]initWithFrame:CGRectMake(123, 435, 230, 5)];
    
    self.slider.continuous = YES;
    
    self.slider.backgroundColor=[UIColor whiteColor];
    
    self.slider.minimumTrackTintColor = [UIColor greenColor];
    
    self.slider.maximumTrackTintColor = [UIColor colorWithWhite:0.949 alpha:1.000];
    
    [self.slider addTarget:self action:@selector(PlaySlider:) forControlEvents:UIControlEventValueChanged];
    
    //progress.Value = player.progress;
    
    [self.slider setThumbImage:[UIImage imageNamed:@"yuan"] forState:UIControlStateNormal];
    
    [self.viewBiger addSubview:self.slider];
    
    
    
    self.labelNumberFirst = [[UILabel alloc]initWithFrame:CGRectMake(123, 440, 30, 30)];
    self.labelNumberFirst.font = [UIFont systemFontOfSize:11];
    [self.viewBiger addSubview:self.labelNumberFirst];
    self.labelNumberFirst.text = @"10秒";
    self.labelNumberFirst.textColor = [UIColor colorWithWhite:0.949 alpha:1.000];
    

    self.labelNumberSecond = [[UILabel alloc]initWithFrame:CGRectMake(223, 440, 30, 30)];
    self.labelNumberSecond.font = [UIFont systemFontOfSize:11];
    [self.viewBiger addSubview:self.labelNumberSecond];
    self.labelNumberSecond.text = @"25秒";
    self.labelNumberSecond.textColor = [UIColor colorWithWhite:0.949 alpha:1.000];

    
    
    self.labelNumberThird = [[UILabel alloc]initWithFrame:CGRectMake(323, 440, 30, 30)];
    self.labelNumberThird.font = [UIFont systemFontOfSize:11];
    [self.viewBiger addSubview:self.labelNumberThird];
    self.labelNumberThird.text = @"25秒";
    self.labelNumberThird.textColor = [UIColor colorWithWhite:0.949 alpha:1.000];
    
}

- (void)PlaySlider:(UISlider *)slider
{
    NSLog(@"滑动");
   
}

- (void)clickFastKaiGuan:(UIButton *)button
{
    NSLog(@"fastkaiguan");
    
    if (self.isSave == YES) {
        [self.buttonFastKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    }else{
        
        [self.buttonFastKaiGuan setImage:[UIImage imageNamed:@"开"] forState:UIControlStateNormal];
    }
    self.isSave = !self.isSave;
}
- (void)clickXianLuKaiGuan:(UIButton *)button
{
    if (self.isSave == YES) {
        [self.buttonXianLuKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    }else{
        
        [self.buttonXianLuKaiGuan setImage:[UIImage imageNamed:@"开"] forState:UIControlStateNormal];
    }
    self.isSave = !self.isSave;
}
- (void)clickWeiLanKaiGuan:(UIButton *)button
{
    if (self.isSave == YES) {
        [self.buttonWeiLanKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    }else{
        
        [self.buttonWeiLanKaiGuan setImage:[UIImage imageNamed:@"开"] forState:UIControlStateNormal];
    }
    self.isSave = !self.isSave;
}
- (void)clickDianHuoKaiGuan:(UIButton *)button
{
    if (self.isSave == YES) {
        [self.buttonDianHuoKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    }else{
        
        [self.buttonDianHuoKaiGuan setImage:[UIImage imageNamed:@"开"] forState:UIControlStateNormal];
    }
    self.isSave = !self.isSave;
}
- (void)clickXiHuoKaiGuan:(UIButton *)button
{
    if (self.isSave == YES) {
        [self.buttonXihuoKaiGuan setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    }else{
        
        [self.buttonXihuoKaiGuan setImage:[UIImage imageNamed:@"开"] forState:UIControlStateNormal];
    }
    
    self.isSave = !self.isSave;

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.self.textFieldKm) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = self.textFieldKm.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 6) {
            return NO;
        }
    }
    
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textFieldKm resignFirstResponder];
}
- (void)clickOBD:(UIButton *)button
{
    NSLog(@"OBD");
}
- (void)clickChaKanWeiLan:(UIButton *)button
{
    NSLog(@"查看围栏");
}
- (void)clickWeiLan:(UIButton *)button
{
    NSLog(@"围栏");
}
- (void)clickXianLu:(UIButton *)button
{
    NSLog(@"线路");
}
- (void)clickChaKanXianLu:(UIButton *)button
{
    NSLog(@"查看线路");
}








@end
