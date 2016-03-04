//
//  ConvenientViewController.m
//  HongFuTong
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "ConvenientViewController.h"

@interface ConvenientViewController()<UIGestureRecognizerDelegate>

@end

@implementation ConvenientViewController


- (void)awakeFromNib{
    self.payCrediet.userInteractionEnabled=YES;
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.delegate=self;
    self.payCrediet.tag=1;
    
//    [self.payCrediet addGestureRecognizer:tap];
    [self.payCredietStack addGestureRecognizer:tap];
}

- (void)tapClick:(UIGestureRecognizer *)gesture{
    NSLog(@"tap : tag:");
}

@end
