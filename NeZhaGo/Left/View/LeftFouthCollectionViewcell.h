//
//  LeftFouthCollectionViewcell.h
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/12.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface LeftFouthCollectionViewcell : BaseCollectionViewCell<UITableViewDelegate,UITableViewDataSource>




@property (nonatomic ,strong)UIView *viewWhitesss;
@property (nonatomic ,strong)UILabel *labelDaosss;
@property (nonatomic ,strong)UILabel *labelDateStartsss;
@property (nonatomic ,strong)UILabel *labelDateEndsss;
@property (nonatomic ,strong)UIButton *buttonSearchsss;
@property (nonatomic ,strong)UILabel *labelCongsss;
@property (nonatomic ,strong)UIButton *buttonStartsss;
@property (nonatomic ,strong)UIButton *buttonEndsss;
@property (nonatomic, strong)UITableView *tableViewLeftMassagesss;

@property (nonatomic ,strong)UIDatePicker *datePickerStartsss;
@property (nonatomic ,strong)UIDatePicker *datePickerEndsss;
@property (nonatomic ,strong)UIButton *buttonStartOversss;
@property (nonatomic ,strong)UIButton *buttonEndOversss;

@property (nonatomic ,strong)UIView *dateViewsss;
@property (nonatomic ,strong)UIView *dateViewEndsss;





@end
