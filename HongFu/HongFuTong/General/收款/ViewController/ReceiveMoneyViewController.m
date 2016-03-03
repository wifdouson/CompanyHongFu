//
//  ReceiveMoneyViewController.m
//  HongFuTong
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "ReceiveMoneyViewController.h"

@interface ReceiveMoneyViewController ()
- (IBAction)leftMenuBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)secondReceiveMoney:(id)sender;
- (IBAction)traditionReceiveMoney:(id)sender;

@end

@implementation ReceiveMoneyViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UtilsHelper setAppNavigationBarHiden];
    self.navigationController.navigationBar.hidden=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (IBAction)leftMenuBtnClick:(id)sender {
}
- (IBAction)secondReceiveMoney:(id)sender {
}

- (IBAction)traditionReceiveMoney:(id)sender {
}
@end
