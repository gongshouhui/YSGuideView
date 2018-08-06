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
@interface YSGuideViewController ()

@end

@implementation YSGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *dataArray = [self getData];
}
- (NSArray *)getData {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"sr" ofType:@"plist"];
    NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSDictionary *dic in plistDic[@"pages"]) {
        YSPageModel *model = [[YSPageModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [mutArr addObject:model];
    }
    return mutArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
