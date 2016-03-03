//
//  ReceiveMoneyViewController.m
//  HongFuTong
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "ReceiveMoneyViewController.h"
#import "BianKuangViewController.h"


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
    
    
    APPOrignalNavigationBarHiden
    
    self.navigationController.navigationBar.hidden=YES;// 本身的view is uinavigationcontroller class
    self.view.backgroundColor=[UIColor whiteColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self config];
}

#pragma mark --配置
- (void)config{
    self.textField.keyboardType=UIKeyboardTypePhonePad;
    self.textField.placeholder=@"请输入金额";
}





#pragma mark --touch begin
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation  segue

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


#pragma mark --左侧点击事件
- (IBAction)leftMenuBtnClick:(id)sender {
    [UtilsHelper setAppNavigationBarShow];
    
    UIStoryboard * mainStoryboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BianKuangViewController * biankuang=[mainStoryboard instantiateViewControllerWithIdentifier:@"leftID"];
    
    CATransition * transition=[CATransition animation];
    
    transition.duration=1;
    
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    transition.type=@"rippleEffect";
//    transition.type=kCATransitionPush;
    [transition setSubtype:kCATransitionFromBottom];

    [APPNV.view.layer addAnimation:transition forKey:nil];
    [APPNV pushViewController:biankuang animated:YES];
    
}
- (IBAction)secondReceiveMoney:(id)sender {
}

- (IBAction)traditionReceiveMoney:(id)sender {
}
@end
