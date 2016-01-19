//
//  CarMassageViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/15.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "CarMassageViewController.h"
#import "CarTianJiaViewController.h"

#import "LeftCarMassColCell.h"
@interface CarMassageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>



@property (nonatomic ,strong)UIView *viewG;
@property (nonatomic ,strong)UILabel *LabelTitle;
@property (nonatomic ,strong)UISearchBar *searchCarNum;
@property (nonatomic ,strong)UIButton *buttonPush;
@property (nonatomic ,strong)UILabel *labelCarNumb;
@property (nonatomic ,strong)UILabel *labelCarSiz;
@property (nonatomic ,strong)UILabel *labelZhongDuan;

@property (nonatomic ,strong)UITableView *tableViewSearch;
@property (nonatomic ,strong)UICollectionView *collectionViews;

@property (nonatomic ,strong)NSMutableArray *arrMutNum;
@property (nonatomic ,strong)NSMutableArray *arrMutSize;
@property (nonatomic ,strong)NSMutableArray *arrMutZhongDuan;


@property (nonatomic ,copy)NSString *string;
@end

@implementation CarMassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    
    self.viewG = [[UIView alloc]init];
    self.viewG.backgroundColor = [UIColor whiteColor];
    self.viewG.frame = CGRectMake(0, 0, WIDTH, 400),
    [self.view addSubview:self.viewG];
    
    
    self.LabelTitle = [UILabel new];
    self.LabelTitle.text = @"车辆信息";
    self.LabelTitle.font = [UIFont systemFontOfSize:18];
    self.LabelTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self.LabelTitle sizeToFit];
    self.navigationItem.titleView = self.LabelTitle;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self createSearch];
    [self createButton];
    [self createArr];
 //   [self createTable];
    [self createCollection];
}

- (void)createArr
{
    self.arrMutNum = [NSMutableArray arrayWithObjects:@"京ABC110",@"京ABC111",@"京ABC112",@"京ABC113",@"京ABC114",@"京ABC115",@"京ABC116",@"京ABC117",@"京ABC118",@"京ABC119", nil];
    
    
    self.arrMutSize = [NSMutableArray arrayWithObjects:@"宝马.X1",@"宝马.X2",@"宝马.X3",@"宝马.X4",@"宝马.X5",@"宝马.X6",@"宝马.X7",@"宝马.X8",@"宝马.X9", nil];
    
    
    self.arrMutSize = [NSMutableArray arrayWithObjects:@"宝马X0", @"宝马X1",@"宝马X2",@"宝马X3",@"宝马X4",@"宝马X5",@"宝马X6",@"宝马X7",@"宝马X8",@"宝马X9",nil];
    
    
    
    
    self.arrMutZhongDuan = [NSMutableArray arrayWithObjects:@"123456789", @"123456789",@"123456789",@"127856789",@"123465789",@"122556789",@"123428989",@"123456789",@"123099889",@"123456119",nil];
}


- (void)createSearch
{
    self.searchCarNum = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 15, 300, 30)];
    self.searchCarNum.placeholder = @"请输入您要搜索的车牌号";
    self.searchCarNum.backgroundColor = [UIColor colorWithRed:215/255.0 green:216/255.0 blue:218/255.0 alpha:1];
    self.searchCarNum.barTintColor = [UIColor whiteColor];
    self.searchCarNum.layer.borderWidth = 1;
    self.searchCarNum.layer.cornerRadius = 4;
    self.searchCarNum.layer.masksToBounds = YES;
    self.searchCarNum.layer.backgroundColor = [UIColor colorWithRed:215/255.0 green:216/255.0 blue:218/255.0 alpha:1].CGColor;
    [self.viewG addSubview:self.searchCarNum];
    
    
    self.labelCarNumb = [UILabel new];
    self.labelCarNumb.frame = CGRectMake(47, 50, 50, 50);
    self.labelCarNumb.font = [UIFont systemFontOfSize:15];
    self.labelCarNumb.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarNumb.text = @"车牌号";
    [self.viewG addSubview:self.labelCarNumb];
    
    
    self.labelCarSiz = [[UILabel alloc]init];
    self.labelCarSiz.frame = CGRectMake(170, 50, 50, 50);
    self.labelCarSiz.font = [UIFont systemFontOfSize:15];
    self.labelCarSiz.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelCarSiz.text = @"车型";
    [self.viewG addSubview:self.labelCarSiz];
    
    
    
    self.labelZhongDuan = [UILabel new];
    self.labelZhongDuan.font = [UIFont systemFontOfSize:15];
    self.labelZhongDuan.frame = CGRectMake(278, 50, 50, 50);
    self.labelZhongDuan.textColor = [UIColor colorWithHexString:@"#333333"];
    self.labelZhongDuan.text = @"终端号";
    [self.viewG addSubview:self.labelZhongDuan];

}




- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.string = searchText;
    self.arrMutNum = [NSMutableArray array];
    self.arrMutSize = [NSMutableArray array];
    self.arrMutZhongDuan = [NSMutableArray array];
}










-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    [self.searchCarNum resignFirstResponder];
}


- (void)createCollection
{
    UICollectionViewFlowLayout *flows = [[UICollectionViewFlowLayout alloc]init];
    flows.itemSize = CGSizeMake(355, 35);
//    flows.minimumInteritemSpacing = 10;
//    flows.minimumLineSpacing = 0;
    self.collectionViews = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 105, 355, 280) collectionViewLayout:flows];
    self.collectionViews.dataSource = self;
    self.collectionViews.delegate = self;
    self.collectionViews.bounces = NO;
    self.collectionViews.showsHorizontalScrollIndicator = NO;
    self.collectionViews.showsVerticalScrollIndicator = NO;
    
    self.collectionViews.backgroundColor = [UIColor whiteColor];
    [self.viewG addSubview:self.collectionViews];
    
    
    [self.collectionViews registerClass:[LeftCarMassColCell class] forCellWithReuseIdentifier:@"reause"];
    
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrMutNum.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     LeftCarMassColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reause" forIndexPath:indexPath];
    
     cell.labeNum.text = self.arrMutNum[indexPath.row];
     cell.labeZhongDuan.text = self.arrMutZhongDuan[indexPath.row];
     cell.labeSize.text = self.arrMutSize[indexPath.row];

     cell.layer.borderWidth = 0.5;
     cell.layer.cornerRadius = 4;
     cell.layer.masksToBounds = YES;

    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"col");
}

//- (void)createTable
//{
//    self.tableViewSearch = [[UITableView alloc]initWithFrame:CGRectMake(10, 105, 355, 280) style:UITableViewStylePlain];
//    //self.tableViewSearch.rowHeight = 35;
//    //self.tableViewSearch.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableViewSearch.bounces = NO;
//    self.tableViewSearch.delegate = self;
//    self.tableViewSearch.dataSource = self;
////    self.tableViewSearch.layer.borderWidth = 1;
////    self.tableViewSearch.layer.cornerRadius = 4;
////    self.tableViewSearch.layer.masksToBounds = YES;
//
//    [self.viewG addSubview:self.tableViewSearch];
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.arrMutNum.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *reuse = @"reuse";
//    LeftCarMassTabCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
//   
//    
//    if (!cell) {
//        
//        cell = [[LeftCarMassTabCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
//        
//        cell.labeNum.text = self.arrMutNum[indexPath.row];
//        cell.labeSize.text = self.arrMutSize[indexPath.row];
//        cell.labeZhongDuan.text = self.arrMutZhongDuan[indexPath.row];
//        cell.layer.borderWidth = 0.5;
//        cell.layer.cornerRadius = 4;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.layer.masksToBounds = YES;
//        cell.layer.backgroundColor = [UIColor redColor].CGColor;
//
//    }
//    return cell;
//    
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"tab");
//}



- (void)createButton
{
    self.buttonPush = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonPush.frame = CGRectMake(310, 0, 60, 60);
    //self.buttonPush.backgroundColor = [UIColor redColor];
    [self.buttonPush setTitle:@"添加" forState:UIControlStateNormal];
    self.buttonPush.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.buttonPush setTitleColor:[UIColor colorWithRed:0/255.0 green:177/255.0 blue:166/255.0 alpha:1] forState:UIControlStateNormal];
    [self.buttonPush addTarget:self action:@selector(clickPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewG addSubview:self.buttonPush];
}


- (void)clickPush:(UIButton *)button
{
    CarTianJiaViewController *carTianJia = [CarTianJiaViewController new];
    [self.navigationController pushViewController:carTianJia animated:YES];
}




- (void)clickLeft:(UIButton*)button
    
{
        
    [self.navigationController popViewControllerAnimated:YES];
    
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
