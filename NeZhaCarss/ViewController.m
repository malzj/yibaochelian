//
//  ViewController.m
//  NeZhaCarss
//
//  Created by 王钧民 on 16/1/5.
//  Copyright © 2016年 王钧民. All rights reserved.
//
#import "MapTableViewCell.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import <MAMapKit/MAMapKit.h>
#import "NezhaManagerViewController.h"
#import "UIColor+Hex.h"
#import "LeftMassageViewController.h"
#import "SelfCheckViewController.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height

#import "TourManagerViewController.h"

#import "JumpPage.h"

@interface ViewController ()<MAMapViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    MAMapView *_mapView;
}
@property (nonatomic ,strong)UILabel *LabelTitle;
@property (nonatomic ,strong)UITableView *myTableView;
@property (nonatomic ,strong)UIButton *buttonLocation;
@property (nonatomic ,strong)UIButton *buttonLighting;
@property (nonatomic ,strong)UIButton *buttonMy;
@property (nonatomic ,strong)UIButton *buttonCar;
@property (nonatomic ,strong)UIButton *buttonAdd;
@property (nonatomic ,strong)UIButton *buttonLose;
@property (nonatomic ,strong)UIImageView *imageViewAdd;
@property (nonatomic ,strong)UIButton *buttonLeft;
@property (nonatomic ,strong)UIButton *rightButton;
@property (nonatomic ,strong)UIView *viewRight;
@property (nonatomic ,strong)UILabel *labelNumbeer;
@property (nonatomic ,strong)UIImageView *imageViewBMW;
@property (nonatomic ,strong)UIView *viewTab;
@property (nonatomic ,strong)UIButton *buttonViewGoCar;
@property (nonatomic ,strong)UIButton *buttonViewNeZha;
@property (nonatomic ,strong)UIButton *buttonViewZiJian;
@property (nonatomic ,strong)UIButton *buttonViewJiaShi;
@property (nonatomic ,strong)UIButton *buttonViewDianSang;
@property (nonatomic ,strong)UILabel *labelGo;
@property (nonatomic ,strong)UILabel *labelNEZHA;
@property (nonatomic ,strong)UILabel *labelZijian;
@property (nonatomic ,strong)UILabel *labelJIaSHI;
@property (nonatomic ,strong)UILabel *labelDianSHang;
@property (nonatomic ,assign) BOOL isSaves;
@property (nonatomic ,strong)UIButton *buttonWatch;
@property (nonatomic ,assign)BOOL isSave;
@property (nonatomic ,strong)UIView *viewWatch;
@property (nonatomic ,strong)UIButton *buttonViewDown;
@property (nonatomic ,strong)UIView *viewWatchBig;
@property (nonatomic ,strong)UILabel *labelCount;
@property (nonatomic ,strong)UIView *viewCount;
@property (nonatomic ,strong)UIView *viewWatchCount;
@property (nonatomic ,strong)UIImageView *imageViewKM;
@property (nonatomic ,strong)UILabel *labelKM;
@property (nonatomic ,strong)UILabel *labelGoKM;
@property (nonatomic ,strong)UIImageView *imageHour;
@property (nonatomic ,strong)UILabel *labelGoHour;
@property (nonatomic ,strong)UILabel *labelHour;
@property (nonatomic ,strong)UIImageView *imageMoney;
@property (nonatomic ,strong)UILabel *labelGoMoney;
@property (nonatomic ,strong)UILabel *labelMoney;
@property (nonatomic ,strong)UIImageView *viewZhiZhenFirst;
@property (nonatomic ,strong)UIImageView *viewZhiZhenSecond;
@property (nonatomic ,strong)UIImageView *viewZhiZhenThird;

@property (nonatomic ,strong)NSMutableArray *arrBMW;


@end
@implementation ViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arrBMW = [NSMutableArray arrayWithObjects:@"奔驰", @"玛莎拉蒂", @"保时捷", @"阿斯顿马丁", @"捷豹", @"兰博基尼", @"夏利" ,@"路虎" , @"凯迪拉克",@"GTR", @"奥迪", @"大众",@"",@"法拉利",nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.LabelTitle = [UILabel new];
    self.LabelTitle.text = @"首页";
    self.LabelTitle.font = [UIFont systemFontOfSize:18];
    self.LabelTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    [self.LabelTitle sizeToFit];
    self.navigationItem.titleView = self.LabelTitle;
    [MAMapServices sharedServices].apiKey = @"bea548341ba5b2f97b2bb58ffcc60e4e";
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    [self createButtonWatch];
    [self createViewTab];
    [self createButton];
    [self createButtonLeft];
    [self createRightButton];
    
    
    
    
    __weak typeof(self) WeekSelf = self;
    
    [JumpPage shareJumpPage].block = ^(UIViewController *controll)
    {
        [[(AppDelegate *)[[UIApplication sharedApplication] delegate] LeftSlideVC] closeLeftView];
        [WeekSelf.navigationController pushViewController:controll animated:YES];
    };
    
        

}


- (void)createButtonWatch
{
    
    self.buttonViewDown = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonViewDown.frame = CGRectMake(0, 64, WIDTH, 47);
    self.buttonViewDown.backgroundColor = [UIColor grayColor];
    self.buttonViewDown.alpha = 0.8;
    [self.view addSubview:self.buttonViewDown];
    [self.buttonViewDown addTarget:self action:@selector(clickDown:) forControlEvents:UIControlEventTouchUpInside];

    [self.buttonViewDown setImage:[UIImage imageNamed:@"下拉按钮"] forState:UIControlStateNormal];
    [self.buttonViewDown setImageEdgeInsets:UIEdgeInsetsMake(27, 0, 0, 0)];
    
    
    self.viewCount = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    self.viewCount.backgroundColor = [UIColor blackColor];
    [self.buttonViewDown addSubview:self.viewCount];
    self.labelCount = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, WIDTH, 20)];
    self.labelCount.textColor = [UIColor colorWithRed:0/255.0 green:186/255.0 blue:13/255.0 alpha:1.000];
    self.labelCount.text = @"驾驶评分:  100分。您的驾驶习惯良好，请继续保持";
    self.labelCount.textAlignment = NSTextAlignmentCenter;
    self.labelCount.font = [UIFont systemFontOfSize:13];
    [self.viewCount addSubview:self.labelCount];
    
    
}

- (void)jumpPage:(UIViewController *)controller
{
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)clickDown:(UIButton *)button
{
    NSLog(@"下拉");
    
    if (!self.isSave) {
       
        _viewWatchBig = [[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 194)];
        _viewWatchBig.backgroundColor = [UIColor blackColor];
        _viewWatchBig.alpha = 0.8;
        [self.view addSubview:_viewWatchBig];
        _buttonViewDown.frame = CGRectMake(0, 258, WIDTH, 44);
        [self.buttonViewDown setImage:[UIImage imageNamed:@"上拉按钮"] forState:UIControlStateNormal];
        
        _imageViewKM = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 120, 110)];
        _imageViewKM.image = [UIImage imageNamed:@"行驶里程"];
        [self.viewWatchBig addSubview:self.imageViewKM];
        
        
        _viewZhiZhenFirst = [[UIImageView alloc]initWithFrame:CGRectMake(51, 10, 18, 57)];
        [self.imageViewKM addSubview:self.viewZhiZhenFirst];
        _viewZhiZhenFirst.image = [UIImage imageNamed:@"大指针"];

        
        
        _labelKM = [[UILabel alloc]initWithFrame:CGRectMake(47, 120, 70, 40)];
        _labelKM.font = [UIFont systemFontOfSize:12];
        _labelKM.textColor = [UIColor whiteColor];
        _labelKM.text = @"800Km";
        [self.viewWatchBig addSubview:self.labelKM];
        
        _labelGoKM = [[UILabel alloc]initWithFrame:CGRectMake(42, 145, 80, 40)];
        _labelGoKM.font = [UIFont systemFontOfSize:12];
        _labelGoKM.textColor = [UIColor whiteColor];
        _labelGoKM.text = @"行驶里程";
        [self.viewWatchBig addSubview:self.labelGoKM];
        
        _imageHour = [[UIImageView alloc]initWithFrame:CGRectMake(130, 10, 120, 120)];
        _imageHour.image = [UIImage imageNamed:@"时钟-拷贝"];
        [self.viewWatchBig addSubview:self.imageHour];
        
        _labelHour = [[UILabel alloc]initWithFrame:CGRectMake(167, 120, 70, 40)];
        _labelHour.font = [UIFont systemFontOfSize:12];
        _labelHour.textColor = [UIColor whiteColor];
        _labelHour.text = @"13小时";
        [self.viewWatchBig addSubview:self.labelHour];
        
        _labelGoHour = [[UILabel alloc]initWithFrame:CGRectMake(163, 145, 80, 40)];
        _labelGoHour.font = [UIFont systemFontOfSize:12];
        _labelGoHour.textColor = [UIColor whiteColor];
        _labelGoHour.text = @"行驶时间";
        [self.viewWatchBig addSubview:self.labelGoHour];

        _viewZhiZhenSecond = [[UIImageView alloc]initWithFrame:CGRectMake(51, 10, 18, 57)];
        [self.imageHour addSubview:self.viewZhiZhenSecond];
        _viewZhiZhenSecond.image = [UIImage imageNamed:@"大指针"];

        
        _imageMoney = [[UIImageView alloc]initWithFrame:CGRectMake(255, 10, 114, 105)];
        _imageMoney.image = [UIImage imageNamed:@"油耗-无颜色"];
        [self.viewWatchBig addSubview:self.imageMoney];
        
        
        _labelMoney = [[UILabel alloc]initWithFrame:CGRectMake(295, 120, 70, 40)];
        _labelMoney.font = [UIFont systemFontOfSize:12];
        _labelMoney.textColor = [UIColor whiteColor];
        _labelMoney.text = @"13小时";
        [self.viewWatchBig addSubview:self.labelMoney];
        
        _labelGoMoney = [[UILabel alloc]initWithFrame:CGRectMake(273, 145, 130, 40)];
        _labelGoMoney.font = [UIFont systemFontOfSize:12];
        _labelGoMoney.textColor = [UIColor whiteColor];
        _labelGoMoney.text = @"52(升)/130(元)";
        [self.viewWatchBig addSubview:self.labelGoMoney];

        
        
        _viewZhiZhenThird = [[UIImageView alloc]initWithFrame:CGRectMake(48, 10, 18, 57)];
        [self.imageMoney addSubview:self.viewZhiZhenThird];
        _viewZhiZhenThird.image = [UIImage imageNamed:@"大指针"];

        
        
        }else{
        
              [self.viewWatchBig removeFromSuperview];
          self.buttonViewDown.frame = CGRectMake(0, 64, WIDTH, 47);
        [self.buttonViewDown setImage:[UIImage imageNamed:@"下拉按钮"] forState:UIControlStateNormal];
        NSLog(@"收回");

    }
    
    
     self.isSave = !self.isSave;
    
}
- (void)createViewTab
{
    self.viewTab = [UIView new];
    self.viewTab.frame = CGRectMake(0, 592, self.view.bounds.size.width, 75);
    [self.view addSubview:self.viewTab];
    self.viewTab.backgroundColor = [UIColor colorWithRed:12/255.0 green:166/255.0 blue:156/255.0 alpha:1];
    
    self.buttonViewGoCar = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonViewGoCar.frame = CGRectMake(21, 5, 45, 45);
    [self.viewTab addSubview:self.buttonViewGoCar];
    [self.buttonViewGoCar setImage:[UIImage imageNamed:@"行程管家图标"] forState:UIControlStateNormal];
    [self.buttonViewGoCar addTarget:self action:@selector(clickGoCar:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelGo = [[UILabel alloc]initWithFrame:CGRectMake(16, 36, 60, 40)];
    self.labelGo.textColor = [UIColor whiteColor];
    self.labelGo.text = @"行车管家";
    [self.viewTab addSubview:self.labelGo];
    self.labelGo.font = [UIFont systemFontOfSize:13];
    
    
    
    
    self.buttonViewNeZha = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonViewNeZha.frame = CGRectMake(86, 5, 45, 45);
    [self.viewTab addSubview:self.buttonViewNeZha];
    [self.buttonViewNeZha setImage:[UIImage imageNamed:@"哪吒管家图标"] forState:UIControlStateNormal];
    [self.buttonViewNeZha addTarget:self action:@selector(clickNeZha:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelNEZHA = [[UILabel alloc]initWithFrame:CGRectMake(81, 36, 60, 40)];
    self.labelNEZHA.textColor = [UIColor whiteColor];
    self.labelNEZHA.text = @"哪吒管家";
    [self.viewTab addSubview:self.labelNEZHA];
    self.labelNEZHA.font = [UIFont systemFontOfSize:13];


    
    
    self.buttonViewZiJian = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonViewZiJian.frame = CGRectMake(152, 570, 70, 70);
    [self.view addSubview:self.buttonViewZiJian];
    [self.buttonViewZiJian setImage:[UIImage imageNamed:@"自检图标"] forState:UIControlStateNormal];
    [self.buttonViewZiJian addTarget:self action:@selector(clickZiJian:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelZijian = [[UILabel alloc]initWithFrame:CGRectMake(174, 36, 60, 40)];
    self.labelZijian.textColor = [UIColor whiteColor];
    self.labelZijian.text = @"自检";
    [self.viewTab addSubview:self.labelZijian];
    self.labelZijian.font = [UIFont systemFontOfSize:13];

        
    self.buttonViewJiaShi = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonViewJiaShi.frame = CGRectMake(243, 5, 45, 45);

    
    [self.viewTab addSubview:self.buttonViewJiaShi];
    [self.buttonViewJiaShi setImage:[UIImage imageNamed:@"驾驶评分图标"] forState:UIControlStateNormal];
    [self.buttonViewJiaShi addTarget:self action:@selector(clickJiaSHI:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelJIaSHI = [[UILabel alloc]initWithFrame:CGRectMake(238, 36, 60, 40)];
    self.labelJIaSHI.textColor = [UIColor whiteColor];
    self.labelJIaSHI.text = @"驾驶评分";
    [self.viewTab addSubview:self.labelJIaSHI];
    self.labelJIaSHI.font = [UIFont systemFontOfSize:13];

    
    
    
    self.buttonViewDianSang = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonViewDianSang.frame = CGRectMake(308, 5, 45, 45);
    [self.viewTab addSubview:self.buttonViewDianSang];
    [self.buttonViewDianSang setImage:[UIImage imageNamed:@"哪吒电商图标"] forState:UIControlStateNormal];
    [self.buttonViewJiaShi addTarget:self action:@selector(clickDianshang:) forControlEvents:UIControlEventTouchUpInside];
    
    self.labelDianSHang = [[UILabel alloc]initWithFrame:CGRectMake(303, 36, 60, 40)];
    self.labelDianSHang.textColor = [UIColor whiteColor];
    self.labelDianSHang.text = @"哪吒电商";
    [self.viewTab addSubview:self.labelDianSHang];
    self.labelDianSHang.font = [UIFont systemFontOfSize:13];
}
#pragma ----tabBar
- (void)clickGoCar:(UIButton *)button
{
    NSLog(@"xingcheguanjia ");

    TourManagerViewController *tourM = [[TourManagerViewController alloc]init];
    [self.navigationController pushViewController:tourM animated:YES];
    

}
- (void)clickNeZha:(UIButton *)button
{
    NSLog(@"nezha");
    NezhaManagerViewController *nezhaMagVC = [NezhaManagerViewController new];
    [self.navigationController pushViewController:nezhaMagVC animated:YES];
    
    
}
- (void)clickZiJian:(UIButton*)button
{
    NSLog(@"zijian");
    SelfCheckViewController *selfCheckVC = [SelfCheckViewController new];
    [self.navigationController pushViewController:selfCheckVC animated:YES];
}
- (void)clickJiaSHI:(UIButton*)button
{
    NSLog(@"jiashi");
}
- (void)clickDianshang:(UIButton*)button
{
    NSLog(@"dianshang");
}
#pragma ----地图上button
- (void)createButton
{
 
    self.buttonLocation = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonLocation.frame = CGRectMake(310, 300, 50, 50);
    [self.buttonLocation setImage:[UIImage imageNamed:@"周边"] forState:UIControlStateNormal];
    [self.view addSubview:self.buttonLocation];
    [self.buttonLocation addTarget:self action:@selector(clickLocation:) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonLighting = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonLighting.frame = CGRectMake(310, 350, 50, 50);
    [self.buttonLighting setImage:[UIImage imageNamed:@"路况"] forState:UIControlStateNormal];
    [self.view addSubview:self.buttonLighting];
    [self.buttonLighting addTarget:self action:@selector(clickLight:) forControlEvents:UIControlEventTouchUpInside];
   
    self.buttonMy = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonMy.frame = CGRectMake(310, 400, 50, 50);
    [self.buttonMy setImage:[UIImage imageNamed:@"手机定位"] forState:UIControlStateNormal];
    [self.view addSubview:self.buttonMy];
    [self.buttonMy addTarget:self action:@selector(clickMy:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonCar = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonCar.frame = CGRectMake(310, 450, 50, 50);
    [self.buttonCar setImage:[UIImage imageNamed:@"车辆定位"] forState:UIControlStateNormal];
    [self.view addSubview:self.buttonCar];
    [self.buttonCar addTarget:self action:@selector(clickCar:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonAdd = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonAdd.frame = CGRectMake(10, 300, 40, 35);
    [self.view addSubview:self.buttonAdd];
    [self.buttonAdd addTarget:self action:@selector(clickAdd:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonAdd.backgroundColor = [UIColor clearColor];
    self.buttonLose = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonLose.frame = CGRectMake(10, 330, 40, 35);
    [self.view addSubview:self.buttonLose];
    [self.buttonLose addTarget:self action:@selector(clickLose:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonLose.backgroundColor = [UIColor clearColor];
    self.imageViewAdd = [[UIImageView alloc]initWithFrame:CGRectMake(10, 305, 40, 70)];
    [self.imageViewAdd setImage:[UIImage imageNamed:@"放大缩小"]];
    [self.view addSubview:self.imageViewAdd];
}
- (void)clickLocation:(UIButton *)button
{
    NSLog(@"location");
    
    
}

- (void)clickLight :(UIButton *)button
{
    NSLog(@"light");
}
- (void)clickMy :(UIButton *)button
{
    NSLog(@"my");
}
- (void)clickCar :(UIButton *)button
{
    NSLog(@"car");
}

- (void)clickAdd :(UIButton *)button
{
    NSLog(@"add");
}
- (void)clickLose :(UIButton *)button
{
    NSLog(@"lose");
}

#pragma -----更多

- (void)createButtonLeft
{
    self.buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonLeft.frame = CGRectMake(0, 0, 20, 20);
    [self.buttonLeft setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.buttonLeft];
    [self.buttonLeft addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
    
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.buttonLeft];

}

- (void)createRightButton
{
    self.rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.rightButton.frame = CGRectMake(300, 0, 90, 60);
    self.rightButton.backgroundColor = [UIColor clearColor];
    [self.rightButton addTarget:self action:@selector(clickRight:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];
    
    self.imageViewBMW = [[UIImageView alloc]initWithFrame:CGRectMake(0, 15, 30, 30)];
    [self.rightButton addSubview:self.imageViewBMW];
    [self.imageViewBMW setImage:[UIImage imageNamed:@"opclo_bu"]];
    
    self.labelNumbeer = [[UILabel alloc]initWithFrame:CGRectMake(35, 15, 55, 30)];
    self.labelNumbeer.text = @"京NYB555";
    self.labelNumbeer.font = [UIFont systemFontOfSize:11];
    self.labelNumbeer.textColor = [UIColor colorWithHexString:@"#FEFEFE"];
    [self.rightButton addSubview:self.labelNumbeer];
    
}

#pragma mark - setters and getters
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(300, 0, 90, 300) style:UITableViewStylePlain];

    }
    return _myTableView;
}
- (void)clickRight:(UIButton *)button
{
    if (self.isSaves == YES) {
        [self.myTableView removeFromSuperview];
    }else{
        NSLog(@"no");
        self.myTableView.frame = CGRectMake(270, 63, 105, 220);
        self.myTableView.dataSource = self;
        self.myTableView.delegate = self;
        self.myTableView.bounces = NO;
        [self.view addSubview:self.myTableView];
        self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone ;
        NSLog(@"yes");

    }
    
      self.isSaves = !self.isSaves;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrBMW.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuse = @"reuse";
    MapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[MapTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
        cell.backgroundColor = [UIColor colorWithRed:12/255.0 green:166/255.0 blue:156/255.0 alpha:1];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        cell.imageViewBMWB.image = [UIImage imageNamed:@"opclo_bu"];
  
        cell.labelNumberBmw.text = self.arrBMW[indexPath.row];
        
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.myTableView removeFromSuperview];

}

- (void) clickLeft
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
