//
//  AlarmView.m
//  Nezha
//
//  Created by cz.jin on 15/11/19.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import "AlarmView.h"
#import "UIColor+Hex.h"
#import "Masonry.h"

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

@implementation AlarmView

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
    self.bgView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self addSubview:self.bgView];
    
    WS(ws);
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws);
        make.left.equalTo(ws);
        make.right.equalTo(ws);
        make.bottom.equalTo(ws);
    }];
    
    [self createAlarmDetail];
}

- (void)createAlarmDetail
{
    UILabel *fromLabel = [UILabel new];
    UILabel *toLabel = [UILabel new];
    UILabel *lblFromTime = [UILabel new];
    UILabel *lblToTime = [UILabel new];
    self.lineView = [UIView new];
    
    fromLabel.numberOfLines = 0;
        
    fromLabel.text = @"从:";
    toLabel.text = @"至:";
    lblFromTime.text = @" 2015-12-01 10:59";
    lblToTime.text = @" 2015-12-01 11:00";
    
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
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13], NSParagraphStyleAttributeName: paragraph};
    
    CGSize size = [fromLabel.text boundingRectWithSize:CGSizeMake(100, 0)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:attribute
                                               context:nil].size;
    
    [self.bgView addSubview:fromLabel];
    [self.bgView addSubview:toLabel];
    [self.bgView addSubview:lblFromTime];
    [self.bgView addSubview:lblToTime];
    [self.bgView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.bgView);
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
    
    NSArray *iconNameArr = @[@"故障", @"低电压", @"水温过高", @"超转速", @"超速驾驶", @"急加速", @"急减速", @"进区域", @"出区域", @"区域超速", @"碰撞"];
    NSMutableArray *iconArr = [NSMutableArray array];
    for (int i=0; i<iconNameArr.count; i++) {
        UIImageView *iconView = [UIImageView new];
        iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@图标.png", iconNameArr[i]]];
        iconView.tag = 400 + i;
        iconView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Click:)];
        [iconView addGestureRecognizer:tap];
        [self.bgView addSubview:iconView];
        [iconArr addObject:iconView];

        switch (i/3) {
            case 0:
            {
                switch (i%3) {
                    case 0:
                    {
                        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(self.lineView.mas_bottom).with.offset(15);
                            make.left.equalTo(@42);
                            make.size.mas_equalTo(CGSizeMake(60, 60));
                        }];
                    }
                        break;
                    default:
                    {
                        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo((UIImageView *)iconArr[i-1]);
                            make.left.equalTo(((UIImageView *)iconArr[i-1]).mas_right).with.offset(52);
                            make.size.mas_equalTo((UIImageView *)iconArr[i-1]);
                        }];
                    }
                        break;
                }
            }
                break;
            default:
                switch (i%3) {
                    case 0:
                    {
                        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(((UIImageView *)iconArr[i-1]).mas_bottom).with.offset(56);
                            make.left.equalTo(@42);
                            make.size.mas_equalTo((UIImageView *)iconArr[i-1]);
                        }];
                    }
                        break;
                        
                    default:
                    {
                        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo((UIImageView *)iconArr[i-1]);
                            make.left.equalTo(((UIImageView *)iconArr[i-1]).mas_right).with.offset(52);
                            make.size.mas_equalTo((UIImageView *)iconArr[i-1]);
                        }];
                    }
                        break;
                }
                break;
        }
        
        UILabel *iconLabel = [UILabel new];
        //iconLabel.backgroundColor = [UIColor orangeColor];
        iconLabel.text = iconNameArr[i];
        iconLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        iconLabel.font = [UIFont systemFontOfSize:16];
        CGSize iconSize =[iconLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
        
        [iconLabel sizeToFit];
        [self.bgView addSubview:iconLabel];
        
        [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(((UIImageView *)iconArr[i]).mas_bottom).with.offset(23);
            make.size.mas_equalTo(iconSize);
            make.centerX.mas_equalTo((UIImageView *)iconArr[i]);
        }];

    }

}

#pragma mark icon点击手势
- (void)Click:(UITapGestureRecognizer *)sender
{
    UIImageView *view = (UIImageView *)sender.view;
    NSInteger index = view.tag;
    
    NSLog(@"%ld", index);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
