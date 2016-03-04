//
//  BianKuangViewController.m
//  HongFuTong
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "BianKuangViewController.h"

@interface BianKuangViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *touxiang;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UIImageView *shimingrenzheng;
@property (weak, nonatomic) IBOutlet UIImageView *jiaoyijilu;
@property (weak, nonatomic) IBOutlet UIImageView *tixianjilu;
@property (weak, nonatomic) IBOutlet UIImageView *shebeiguanli;

@property (weak, nonatomic) IBOutlet UIImageView *tongzhi;
@property (weak, nonatomic) IBOutlet UIImageView *bangzhu;

@property (weak, nonatomic) IBOutlet UIImageView *setting;
@property (weak, nonatomic) IBOutlet UIImageView *huancun;




@end

@implementation BianKuangViewController

- (void)awakeFromNib{
    [self setLeftMenu];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}


- (void)setLeftMenu{
    UIBarButtonItem * leftItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftClick)];
    //此处不要用appnv ，会被覆盖
    self.navigationItem.leftBarButtonItem=leftItem;
    
}

- (void)leftClick{
    

    CATransition * transition=[CATransition animation];
    transition.duration=1;
    transition.type=@"rippleEffect";
    transition.subtype=kCATransitionFromTop;
    [APPNV.view.layer addAnimation:transition forKey:nil];

    [APPNV popViewControllerAnimated:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
