//
//  OriginalViewController.m
//  HongFuTong
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "OriginalViewController.h"

@interface OriginalViewController ()
- (IBAction)push:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;

@end

@implementation OriginalViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.pushBtn setTitleColor:[UtilsHelper colorWithHexString:@"#b72221"] forState:UIControlStateNormal];
    
    
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

- (IBAction)push:(id)sender {
    //淡入效果
    UINavigationController * nv=[self.storyboard instantiateViewControllerWithIdentifier:@"mainNV"];
    [nv.view.layer addAnimation:[UtilsHelper transitionWithRippleEffect] forKey:nil];
    //更改数据库配置 将originallogin 
    DataController * dataController=[[DataController alloc]init];
    [dataController changeOriginalLoginStatus];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
