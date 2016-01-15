//
//  LeftThirdCollectionViewcell.h
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/12.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface LeftThirdCollectionViewcell : BaseCollectionViewCell<UITableViewDelegate,UITableViewDataSource>



@property (nonatomic ,strong)UIView *viewWhitess;
@property (nonatomic ,strong)UILabel *labelDaoss;
@property (nonatomic ,strong)UILabel *labelDateStartss;
@property (nonatomic ,strong)UILabel *labelDateEndss;
@property (nonatomic ,strong)UIButton *buttonSearchss;
@property (nonatomic ,strong)UILabel *labelCongss;
@property (nonatomic ,strong)UIButton *buttonStartss;
@property (nonatomic ,strong)UIButton *buttonEndss;
@property (nonatomic, strong)UITableView *tableViewLeftMassagess;

@property (nonatomic ,strong)UIDatePicker *datePickerStartss;
@property (nonatomic ,strong)UIDatePicker *datePickerEndss;
@property (nonatomic ,strong)UIButton *buttonStartOverss;
@property (nonatomic ,strong)UIButton *buttonEndOverss;

@property (nonatomic ,strong)UIView *dateViewss;
@property (nonatomic ,strong)UIView *dateViewEndss;




@end
