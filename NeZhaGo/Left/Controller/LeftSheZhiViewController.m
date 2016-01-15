//
//  LeftSheZhiViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/14.
//  Copyright © 2016年 王钧民. All rights reserved.
//

#import "LeftSheZhiViewController.h"
#import "BaseCollectionViewCell.h"
#import "LeftSheZhiCollectionCell.h"
#import "LeftSheZhiSecondCollectionCell.h"
@interface LeftSheZhiViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (nonatomic ,strong)UICollectionView *collectionViewSheZhi;
@property (nonatomic ,strong)UILabel *LabelTitle;

@property (nonatomic ,strong)UIScrollView *scrollViewSheZhi;
@property (nonatomic ,strong)NSArray *arrSEGG;
@property (nonatomic ,strong)UISegmentedControl *segSheZhi;
@property (nonatomic ,strong)UIView *viewOranger;
@end

@implementation LeftSheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.LabelTitle = [UILabel new];
    self.LabelTitle.text = @"设置";
    self.LabelTitle.font = [UIFont systemFontOfSize:18];
    self.LabelTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self.LabelTitle sizeToFit];
    self.navigationItem.titleView = self.LabelTitle;
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft:)];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self createScol];
    
    [self createCollection];

    
}

- (void)createScol
{
    self.scrollViewSheZhi = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 125)];
    self.scrollViewSheZhi.backgroundColor = [UIColor clearColor];
    self.scrollViewSheZhi.contentSize = CGSizeMake(WIDTH * 1.3, HEIGHT);
    self.scrollViewSheZhi.showsHorizontalScrollIndicator = NO;
    self.scrollViewSheZhi.showsVerticalScrollIndicator = NO;
    self.scrollViewSheZhi.delegate = self;
    [self.view addSubview:self.scrollViewSheZhi];
    
    self.arrSEGG = [[NSArray alloc]initWithObjects:@"保养预约",@"报警设置", nil];
    self.segSheZhi = [[UISegmentedControl alloc]initWithItems:self.arrSEGG];
    self.segSheZhi.frame = CGRectMake(0, 0, WIDTH, 45);
    self.segSheZhi.tintColor = [UIColor whiteColor];
    self.segSheZhi.selectedSegmentIndex = 0;
    
    
    
  
    self.viewOranger = [UIView new];
    self.viewOranger.backgroundColor = [UIColor orangeColor];
    [self.scrollViewSheZhi addSubview:self.viewOranger];

    
    
    
    
    
    
    
    
    //修改字体
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor grayColor]};
    [self.segSheZhi setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14], NSForegroundColorAttributeName: [UIColor grayColor]};
    [self.segSheZhi setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    [self.segSheZhi addTarget:self action:@selector(clickSege:) forControlEvents:UIControlEventValueChanged];
    
    [self.scrollViewSheZhi addSubview:self.segSheZhi];


    
    
}



- (void)clickSege:(UISegmentedControl *)segmentedControl
{
    NSInteger number = self.segSheZhi.selectedSegmentIndex;
    self.collectionViewSheZhi.contentOffset = CGPointMake(number *WIDTH, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger number = self.collectionViewSheZhi.contentOffset.x / WIDTH;
    
    self.segSheZhi.selectedSegmentIndex = number;
    
}


-(void)clickLeft:(UIButton*)button

{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}





- (void)createCollection
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(WIDTH, HEIGHT-64);
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 0;
    
    self.collectionViewSheZhi = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 120, WIDTH, 557) collectionViewLayout:flow];
    
    
    _collectionViewSheZhi.showsHorizontalScrollIndicator = NO;
    _collectionViewSheZhi.showsVerticalScrollIndicator = NO;
    _collectionViewSheZhi.pagingEnabled = YES;
    _collectionViewSheZhi.backgroundColor = [UIColor whiteColor];
    self.collectionViewSheZhi.dataSource = self;
    _collectionViewSheZhi.bounces = NO;
    self.collectionViewSheZhi.delegate = self;
    [self.view addSubview:self.collectionViewSheZhi];
    [self.collectionViewSheZhi registerClass:[LeftSheZhiCollectionCell class] forCellWithReuseIdentifier:@"insider"];
    [self.collectionViewSheZhi registerClass:[LeftSheZhiSecondCollectionCell class] forCellWithReuseIdentifier:@"Secinsider"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0) {
        LeftSheZhiCollectionCell *celler = [collectionView dequeueReusableCellWithReuseIdentifier:@"insider" forIndexPath:indexPath];
        celler.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];

        
        self.viewOranger.frame = CGRectMake(5, 48, 170, 2);
        
   
        
        return celler;

    }else{
        LeftSheZhiSecondCollectionCell *Scell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Secinsider" forIndexPath:indexPath];
        
        
        self.viewOranger.frame = CGRectMake(200, 48, 170, 2);
        Scell.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];

        
        [Scell addSubview:Scell.viewBiger];
        
        return Scell;
    }
    
}







- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
