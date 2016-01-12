//
//  LeftMassageViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/8.
//  Copyright © 2016年 王钧民. All rights reserved.
//
#import "LeftFouthCollectionViewcell.h"
#import "LeftThirdCollectionViewcell.h"
#import "LeftMassageViewController.h"
#import "UIColor+Hex.h"
#import "LeftSecondCollectionViewcell.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
#import "LeftMassageCollectionViewCell.h"

@interface LeftMassageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UILabel *LabelTitle;
@property (nonatomic ,strong)UISegmentedControl *segmentedControlMassage;
@property (nonatomic ,strong)NSArray *arrSeg;

@property (nonatomic ,strong)UIScrollView *scollerViewD;
@property (nonatomic ,strong)UIView *viewHua;
@property (nonatomic ,strong)UICollectionView *mainCollectionView;


@property (nonatomic ,strong)UIButton *buttonStart;
@property (nonatomic ,strong)UIButton *buttonEnd;


@property (nonatomic ,strong)UIView *viewOrange;


@property (nonatomic ,strong) UITableView *tableViewLeftMassage;


@property (nonatomic ,strong) NSMutableArray *arraaaa;

//@property (nonatomic ,strong)UIDatePicker *datePickerStart;
//@property (nonatomic ,strong)UIDatePicker *datePickerEnd;
//@property (nonatomic ,strong)UIButton *buttonStartOver;
//@property (nonatomic ,strong)UIButton *buttonEndOver;
//@property (nonatomic ,strong)UIView *dateView;
//@property (nonatomic ,strong)UIView *dateViewEnd;
//@property (nonatomic ,strong)UILabel *inLabel;
//@property (nonatomic ,strong)UILabel *outLabel;
@end

@implementation LeftMassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.LabelTitle = [UILabel new];
    self.LabelTitle.text = @"我的消息";
    self.LabelTitle.font = [UIFont systemFontOfSize:18];
    self.LabelTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self.LabelTitle sizeToFit];
    self.navigationItem.titleView = self.LabelTitle;
   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
//    self.viewOrange = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 5)];
//    self.viewOrange.backgroundColor = [UIColor orangeColor];
//    [self.viewHua addSubview:self.viewOrange];

    
   
    
    
    [self createSegmentedControlMassage];
    [self createCollection];
    [self createDate];
}



-(void)clickLeft:(UIButton*)button
    
{
        
   [self.navigationController popViewControllerAnimated:YES];
        
}

- (void)createSegmentedControlMassage
{
    
    self.scollerViewD = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 125)];
    self.scollerViewD.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scollerViewD];
       //横着拽
    self.scollerViewD.contentSize = CGSizeMake(WIDTH*1.3,HEIGHT);
    self.scollerViewD.showsHorizontalScrollIndicator = NO;
    self.scollerViewD.showsVerticalScrollIndicator = NO;

    self.scollerViewD.delegate = self;
    
    
    
    self.arrSeg = [[NSArray alloc]initWithObjects:@"全部",@"报警",@"系统",@"提醒", nil];
    self.segmentedControlMassage = [[UISegmentedControl alloc]initWithItems:self.arrSeg];
    self.segmentedControlMassage.frame = CGRectMake(0, 0, WIDTH, 45);
    self.segmentedControlMassage.tintColor = [UIColor whiteColor];
    self.segmentedControlMassage.selectedSegmentIndex = 0;


    
    self.viewHua = [[UIView alloc]initWithFrame:CGRectMake(5, 49, WIDTH-10, 1)];
    self.viewHua.backgroundColor = [UIColor grayColor];
    self.viewHua.alpha = 0.9;
    [self.scollerViewD addSubview:self.viewHua];
    
    
    
    self.viewOrange = [UIView new];
    self.viewOrange.backgroundColor = [UIColor orangeColor];
    [self.scollerViewD addSubview:self.viewOrange];

    
    
    
    
    
    
    //修改字体
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor grayColor]};
    [self.segmentedControlMassage setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14], NSForegroundColorAttributeName: [UIColor grayColor]};
    [self.segmentedControlMassage setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    [self.segmentedControlMassage addTarget:self action:@selector(clickSeg:) forControlEvents:UIControlEventValueChanged];
    
    [self.scollerViewD addSubview:self.segmentedControlMassage];
}
- (void)clickSeg:(UISegmentedControl *)segmentedControl
{
    NSInteger number = self.segmentedControlMassage.selectedSegmentIndex;
    
    self.mainCollectionView.contentOffset = CGPointMake(number * WIDTH, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger number = self.mainCollectionView.contentOffset.x / WIDTH;
    
    self.segmentedControlMassage.selectedSegmentIndex = number;

}

- (void)createDate
{
    
    
}

- (void)createCollection
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(WIDTH, HEIGHT - 64);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    self.mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 120, WIDTH, 557) collectionViewLayout:flowLayout];
    
    
    _mainCollectionView.showsHorizontalScrollIndicator = NO;
    _mainCollectionView.showsVerticalScrollIndicator = NO;
    _mainCollectionView.pagingEnabled = YES;
    _mainCollectionView.backgroundColor = [UIColor whiteColor];

    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.delegate = self;
    [self.view addSubview:self.mainCollectionView];
    [self.mainCollectionView registerClass:[LeftMassageCollectionViewCell class] forCellWithReuseIdentifier:@"reuase"];
    [self.mainCollectionView registerClass:[LeftSecondCollectionViewcell class] forCellWithReuseIdentifier:@"indexr"];
     [self.mainCollectionView registerClass:[LeftThirdCollectionViewcell class] forCellWithReuseIdentifier:@"Third"];
    [self.mainCollectionView registerClass:[LeftFouthCollectionViewcell class] forCellWithReuseIdentifier:@"fouth"];
 

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.item == 0) {
        LeftMassageCollectionViewCell *leftCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuase" forIndexPath:indexPath];
        
  
        [leftCell addSubview:leftCell.viewWhite];
        leftCell.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
             leftCell.labelCong.text = @"从";
        leftCell.labelDao.text = @"至";
        [leftCell addSubview:leftCell.buttonSearch];
        
        [leftCell.buttonSearch addTarget:self action:@selector(clickSearch:) forControlEvents:UIControlEventTouchUpInside];

        
        
        self.viewOrange.frame = CGRectMake(5, 48, 80, 2);
        
        
        
          return leftCell;

    }else if (indexPath.item == 1){
        {
            LeftSecondCollectionViewcell *secSecond = [collectionView dequeueReusableCellWithReuseIdentifier:@"indexr" forIndexPath:indexPath];
            
            self.viewOrange.frame = CGRectMake(100, 48, 80, 2);

            
            return secSecond;
            
        }

    }else if (indexPath.item == 2){
        {
            LeftThirdCollectionViewcell *third = [collectionView dequeueReusableCellWithReuseIdentifier:@"Third" forIndexPath:indexPath];
            
            self.viewOrange.frame = CGRectMake(195, 48, 80, 2);

            
            return third;
            
        }

    }else{
        LeftFouthCollectionViewcell *fouth = [collectionView dequeueReusableCellWithReuseIdentifier:@"fouth" forIndexPath:indexPath];
        
        self.viewOrange.frame = CGRectMake(285, 48, 85, 2);
        
        return fouth;
        
    }
  
}




- (void)clickSearch:(UIButton *)button
{
        NSLog(@"button");
   
//    if (self.arraaaa == nil) {
//        NSLog(@"kong");
//    }else{
//        self.tableViewLeftMassage.dataSource = self;
//        self.tableViewLeftMassage.delegate = self;
//        self.tableViewLeftMassage = [[UITableView alloc]initWithFrame:CGRectMake(0, 240, WIDTH, 300) style:UITableViewStylePlain];
//        [self.view addSubview:self.tableViewLeftMassage];
//        self.tableViewLeftMassage.separatorStyle = UITableViewCellSeparatorStyleNone;
//    }
    

        self.tableViewLeftMassage.dataSource = self;
        self.tableViewLeftMassage.delegate = self;
        self.tableViewLeftMassage = [[UITableView alloc]initWithFrame:CGRectMake(0, 240, WIDTH, 300) style:UITableViewStylePlain];
        [self.view addSubview:self.tableViewLeftMassage];
        self.tableViewLeftMassage.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reusesss = @"reusesss";
    UITableViewCell *celler = [tableView dequeueReusableCellWithIdentifier:reusesss];
    if (!celler) {
        celler = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusesss];
    }
    
    
    
    return celler;
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
