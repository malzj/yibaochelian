//
//  BasicInfoView.m
//  Nezha
//
//  Created by cz.jin on 15/12/7.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "BasicInfoView.h"
#import "UIColor+Hex.h"
#import "masonry.h"

#define WS(weakSelf) __weak __typeof (&*self)weakSelf = self;

@implementation BasicInfoView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.bgView = [UIView new];
    //bgView.frame = CGRectMake(0, 0, 20, 20);
    self.bgView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8" alpha:1];
    [self addSubview:self.bgView];
    
    WS(ws);
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws);
        make.left.equalTo(ws);
        make.right.equalTo(ws);
        make.bottom.equalTo(ws);
    }];
    
    [self createLogo];
    [self createInfo];
    [self createButton];
}

- (void)createLogo
{
    /**
     车辆型号底图
     */
    self.bgImageView = [UIImageView new];
    self.bgImageView.image = [UIImage imageNamed:@"设备型号背景"];
    [self.bgView addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).with.offset(5) ;
        make.left.equalTo(self.bgView);
        make.width.mas_equalTo(self.bgView);
        make.height.mas_equalTo(@97);
    }];
    
    /**
     车辆头像
     */
    UIImageView *logoView = [UIImageView new];
    logoView.backgroundColor = [UIColor whiteColor];
    logoView.layer.cornerRadius = 36;
    logoView.layer.masksToBounds = YES;
    [self.bgImageView addSubview:logoView];
    
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@35);
        make.centerY.mas_equalTo(self.bgImageView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(72, 72));
    }];
    
    /**
     车辆型号
     */
    UILabel *lbl_CarType = [UILabel new];
    lbl_CarType.text = @"车辆型号:宝马760Li";
    lbl_CarType.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    lbl_CarType.font = [UIFont boldSystemFontOfSize:15];
    [self.bgImageView addSubview:lbl_CarType];
    
    [lbl_CarType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.left.equalTo(logoView.mas_right).with.offset(17);
        make.height.equalTo(@15);
        make.right.equalTo(self.bgImageView);
    }];
    
    /**
     SN
     */
    UILabel *lbl_SN = [UILabel new];
    lbl_SN.text = @"设备编号:4359386532567161";
    lbl_SN.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    lbl_SN.font = [UIFont boldSystemFontOfSize:15];
    [self.bgImageView addSubview:lbl_SN];
    
    [lbl_SN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lbl_CarType.mas_left);
        make.top.equalTo(lbl_CarType.mas_bottom).with.offset(10);
        make.size.mas_equalTo(lbl_CarType);
    }];
}

- (void)createInfo
{
    /**
     状态底图
     */
    self.conditionView = [UIView new];
    self.conditionView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:self.conditionView];
    
    [self.conditionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImageView.mas_bottom).with.offset(10);
        make.left.equalTo(self.bgImageView);
        make.width.equalTo(self.bgImageView);
        make.height.equalTo(@204);
    }];
    
    NSArray *lblNameArr = @[@"设备状态:", @"最新位置:", @"未读警报:", @"设备速度:"];
    NSMutableArray *lineArray = [NSMutableArray array];
    NSMutableArray *lableArray = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithHexString:@"#DADADA"];
        [self.conditionView addSubview:lineView];
        [lineArray addObject:lineView];
        
        if (i==0) {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.conditionView.mas_top).with.offset(50);
                make.left.equalTo(self.conditionView).with.offset(10);
                make.right.equalTo(self.conditionView).with.offset(-10);
                make.height.equalTo(@1);
            }];
        }
        else if (i==3) {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(((UIView *)lineArray[i-1]).mas_bottom).with.offset(50);
                make.width.equalTo(self.conditionView);
                make.height.equalTo(@1);
            }];
        }
        else
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(((UIView *)lineArray[i-1]).mas_bottom).with.offset(50);
                make.left.equalTo(self.conditionView).with.offset(10);
                make.right.equalTo(self.conditionView).with.offset(-10);
                make.height.equalTo(@1);
            }];
        }
        
        UILabel *label = [UILabel new];
        label.text = lblNameArr[i];
        [lableArray addObject:label];
        [self.conditionView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(((UIView *)lineArray[i]).mas_top).with.offset(-17);
            make.left.equalTo(self.conditionView).with.offset(10);
            make.height.equalTo(@15);
            make.width.width.equalTo(@85);
        }];
    }
    
}

- (void)createButton
{
    self.btn_Reload = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn_Reload.layer.cornerRadius = 4;
    self.btn_Reload.layer.masksToBounds = YES;
    [self.btn_Reload setTitle:@"刷新数据" forState:UIControlStateNormal];
    self.btn_Reload.backgroundColor = [UIColor colorWithHexString:@"#FFAB48"];
    [self.btn_Reload setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    self.btn_Reload.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.btn_Reload addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];//kvo
    [self.bgView addSubview:self.btn_Reload];
    
    self.btn_MyNavi = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn_MyNavi.layer.cornerRadius = 4;
    self.btn_MyNavi.layer.masksToBounds = YES;
    [self.btn_MyNavi setTitle:@"设备导航" forState:UIControlStateNormal];
    self.btn_MyNavi.backgroundColor = [UIColor colorWithHexString:@"#FFAB48"];
    [self.btn_MyNavi setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    self.btn_MyNavi.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.btn_MyNavi addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bgView addSubview:self.btn_MyNavi];
    
    [self.btn_Reload mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.conditionView.mas_bottom).with.offset(35);
        make.left.equalTo(self.bgView).with.offset(10);
        make.right.equalTo(self.btn_MyNavi.mas_left).with.offset(-30);
        make.height.equalTo(@40);
        make.width.equalTo(self.btn_MyNavi);
    }];
    
    [self.btn_MyNavi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.btn_Reload);
        make.top.equalTo(self.btn_Reload);
        make.left.equalTo(self.btn_Reload.mas_right).with.offset(30);
        make.right.equalTo(self.bgView).with.offset(-10);
    }];
    
    self.btn_DeviceNavi = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn_DeviceNavi.layer.cornerRadius = 4;
    self.btn_DeviceNavi.layer.masksToBounds = YES;
    [self.btn_DeviceNavi setTitle:@"设备追踪" forState:UIControlStateNormal];
    self.btn_DeviceNavi.backgroundColor = [UIColor colorWithHexString:@"#FFAB48"];
    [self.btn_DeviceNavi setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    self.btn_DeviceNavi.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.btn_DeviceNavi addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
    [self.bgView addSubview:self.btn_DeviceNavi];
    
    [self.btn_DeviceNavi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn_MyNavi.mas_bottom).with.offset(20);
        make.left.equalTo(self.bgView).with.offset(10);
        make.right.equalTo(self.bgView).with.offset(-10);
        make.height.equalTo(self.btn_MyNavi.mas_height);
    }];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
    UIButton * button = (UIButton *)object;
    if ([[change objectForKey:@"new"] integerValue] == 1) {
        button.backgroundColor = [UIColor colorWithHexString:@"#ec9734"];
    }
    else
    {
        button.backgroundColor = [UIColor colorWithHexString:@"#FFAB48"];
    }
    
}

- (void)dealloc
{
    [self.btn_DeviceNavi removeObserver:self forKeyPath:@"highlighted"];
    [self.btn_MyNavi removeObserver:self forKeyPath:@"highlighted"];
    [self.btn_Reload removeObserver:self forKeyPath:@"highlighted"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
