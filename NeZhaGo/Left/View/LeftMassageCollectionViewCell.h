//
//  LeftMassageCollectionViewCell.h
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/8.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface LeftMassageCollectionViewCell : BaseCollectionViewCell
@property (nonatomic ,strong)UIView *viewWhite;
@property (nonatomic ,strong)UILabel *labelDao;
@property (nonatomic ,strong)UILabel *labelDateStart;
@property (nonatomic ,strong)UILabel *labelDateEnd;
@property (nonatomic ,strong)UIButton *buttonSearch;
@property (nonatomic ,strong)UILabel *labelCong;
@property (nonatomic ,strong)UIButton *buttonStart;
@property (nonatomic ,strong)UIButton *buttonEnd;






@property (nonatomic ,strong)UIDatePicker *datePickerStart;
@property (nonatomic ,strong)UIDatePicker *datePickerEnd;
@property (nonatomic ,strong)UIButton *buttonStartOver;
@property (nonatomic ,strong)UIButton *buttonEndOver;

@property (nonatomic ,strong)UIView *dateView;
@property (nonatomic ,strong)UIView *dateViewEnd;
//@property (nonatomic ,strong)UILabel *inLabel;
//@property (nonatomic ,strong)UILabel *outLabel;







@end
