//
//  DataController+Original.h
//  HongFuTong
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "DataController.h"

@interface DataController (Original)

#pragma mark －－直接判断，如果没有origin信息，则进行插入，并返回no，如果有信息，则返回该信息
- (BOOL)isOriginalLogin;


@end
