//
//  MainTableViewController.m
//  HongFuTong
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "MainTableViewController.h"
#import "OriginalViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
#pragma mark --判断是否启动页
    DataController * dataController=[[DataController alloc]init];
    if([dataController isOriginalLogin]){
        
        UIStoryboard * mainStoryboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        OriginalViewController * originalVC=[mainStoryboard instantiateViewControllerWithIdentifier:@"OriginalViewController"];
 
        [APPVC presentViewController:originalVC animated:NO completion:nil];
        
    }else{
        
    }
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
