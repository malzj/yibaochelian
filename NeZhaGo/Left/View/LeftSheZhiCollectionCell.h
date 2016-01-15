//
//  LeftSheZhiCollectionCell.h
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/14.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface LeftSheZhiCollectionCell : BaseCollectionViewCell
@property (nonatomic ,strong)UIView *viewSmall;
@property (nonatomic ,strong)UILabel *labelBaoYangLiCheng;
@property (nonatomic ,strong)UILabel *labelBaoYangShiJian;
@property (nonatomic ,strong)UILabel *labelLast;
@property (nonatomic ,strong)UILabel *labelLastTime;


@property (nonatomic ,strong)UIView *viewLineOne;
@property (nonatomic ,strong)UIView *viewLineTwo;
@property (nonatomic ,strong)UIView *viewLineThree;
@property (nonatomic ,strong)UIView *viewLinefour;




@property (nonatomic ,strong)UITextField *textFieldFirst;
@property (nonatomic ,strong)UITextField *textFieldSecond;
@property (nonatomic ,strong)UITextField *textFieldThird;



@property (nonatomic ,strong)UILabel *labelTuiJian;
@property (nonatomic ,strong)UICollectionView *collectionViewKM;







@property (nonatomic ,strong)UIButton *buttonDate;
@property (nonatomic ,strong)UIView *dateViews;
@property (nonatomic ,strong)UIDatePicker *datePickers;
@property (nonatomic ,strong)UIButton *buttonnOver;




@end
