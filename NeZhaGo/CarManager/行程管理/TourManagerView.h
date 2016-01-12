//
//  TourManagerView.h
//  Nezha
//
//  Created by cz.jin on 15/11/19.
//  Copyright © 2015年 cz.jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TourManagerView : UIView<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}

@property(nonatomic, strong)UIView *bgView;
@property(nonatomic, strong)UIView *headerView;
@property(nonatomic, strong)UIView *lineView;

@end
