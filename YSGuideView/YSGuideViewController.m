//
//  YSGuideViewController.m
//  YSGuideView
//
//  Created by 罗罗诺亚索隆 on 2018/8/6.
//  Copyright © 2018年 mianduijifengba. All rights reserved.
//

#import "YSGuideViewController.h"
#import "YSConstants.h"
#import "YSPageModel.h"
#import "YSGuideView.h"
@interface YSGuideViewController ()

@end

@implementation YSGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[YSGuideView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
