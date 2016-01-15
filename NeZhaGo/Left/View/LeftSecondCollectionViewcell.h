//
//  LeftSecondCollectionViewcell.h
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/8.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface LeftSecondCollectionViewcell : BaseCollectionViewCell<UITableViewDataSource,UITableViewDelegate>



@property (nonatomic ,strong)UIView *viewWhites;
@property (nonatomic ,strong)UILabel *labelDaos;
@property (nonatomic ,strong)UILabel *labelDateStarts;
@property (nonatomic ,strong)UILabel *labelDateEnds;
@property (nonatomic ,strong)UIButton *buttonSearchs;
@property (nonatomic ,strong)UILabel *labelCongs;
@property (nonatomic ,strong)UIButton *buttonStarts;
@property (nonatomic ,strong)UIButton *buttonEnds;
@property (nonatomic, strong)UITableView *tableViewLeftMassages;

@property (nonatomic ,strong)UIDatePicker *datePickerStarts;
@property (nonatomic ,strong)UIDatePicker *datePickerEnds;
@property (nonatomic ,strong)UIButton *buttonStartOvers;
@property (nonatomic ,strong)UIButton *buttonEndOvers;

@property (nonatomic ,strong)UIView *dateViews;
@property (nonatomic ,strong)UIView *dateViewEnds;



@end
