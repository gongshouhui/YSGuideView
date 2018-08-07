//
//  YSGuideView.m
//  YSGuideView
//
//  Created by 罗罗诺亚索隆 on 2018/8/7.
//  Copyright © 2018年 mianduijifengba. All rights reserved.
//

#import "YSGuideView.h"
#import "YSConstants.h"
#import "YSPageModel.h"
@interface YSGuideView()
@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIImageView *topImageView;
@property (nonatomic,strong) UIImageView *bottomImageView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,assign) CGPoint originCenter;
@end
@implementation YSGuideView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
        self.dataArr = [self getData];
        [self reloadView];
    }
    return self;
}
- (void)initUI {
    self.backgroundColor = [UIColor whiteColor];
    //背景
    self.bgImageView = [[UIImageView alloc]init];
    self.bgImageView.frame = self.frame;
    [self addSubview:self.bgImageView];
    //上方图
    self.topImageView = [[UIImageView alloc]init];
    [self addSubview:self.topImageView];
    self.topImageView.frame = CGRectMake(0, 0, 60, 60);
    self.topImageView.center = CGPointMake(self.center.x, 40+25);
   
    
    //下方图
    self.bottomImageView = [[UIImageView alloc]init];
    [self addSubview:self.bottomImageView];
    self.bottomImageView.frame = CGRectMake(0, 0, 50, 50);
    self.bottomImageView.center = CGPointMake(self.center.x, SCREEN_HEIGHT - 40 -25);
    self.bottomImageView.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    self.bottomImageView.gestureRecognizers = @[panGes];
    self.originCenter = self.bottomImageView.center;
    
    
   
}
- (void)reloadView {
    YSPageModel *model = self.dataArr[self.index];
    self.bgImageView.image = [UIImage imageNamed:model.bgimageName];
    self.topImageView.image = [UIImage imageNamed:model.topimageName];
    self.bottomImageView.image = [UIImage imageNamed:model.bottomImageName];
    
}
//获取plist里的数据
- (NSMutableArray *)getData {
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

- (void)panAction:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer translationInView:self];
    //找到当前点击的view
    UIImageView* originImageView = (UIImageView*)panGestureRecognizer.view;
    NSLog(@"%@",NSStringFromCGPoint(point));
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
    }
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        // 找到当前点击的view相对与controler的位置, 因为如果直接使用originImageView的frame是不对的
        //        CGPoint imageViewPoint = [self.view convertPoint:originImageView.center fromView:originImageView];
        self.bottomImageView.center = CGPointMake(self.originCenter.x + point.x, self.originCenter.y + point.y);
    }
   
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        // 判断是否当前移动的点是否在圈内
        if ([self circleFrame:self.topImageView.frame constanFrame:self.bottomImageView.frame]) {
            self.topImageView.image = originImageView.image;
             self.index++;
            [self originalPosition];
            [self nextScene];
        }else{
            [UIView animateWithDuration:1 animations:^{
                self.bottomImageView.center = self.originCenter;
            }];
            
        }
    }
}
- (BOOL)circleFrame:(CGRect)cirCleFrame constanFrame:(CGRect)otherCircleFrame {
    
    CGFloat xMargin = cirCleFrame.origin.x - otherCircleFrame.origin.x;
    CGFloat yMargin = cirCleFrame.origin.y - otherCircleFrame.origin.y;
    CGFloat distance = sqrtf(xMargin * xMargin + yMargin * yMargin);
    
    if (distance < cirCleFrame.size.width - otherCircleFrame.size.width) {
        return YES;
    }
    
    return NO;
}
- (void)nextScene {
    if (self.index < self.dataArr.count) {
        [self reloadView];
    }
    
    if (self.index == self.dataArr.count) {//在最后一张图拼成功后
        self.topImageView.hidden = YES;
        self.bottomImageView.hidden = YES;
        UIButton *nestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [nestButton setImage:[UIImage imageNamed:@"startgame-2.png"] forState:UIControlStateNormal];
        [self addSubview:nestButton];
        nestButton.frame = CGRectMake(0, 0, SCREEN_WIDTH, 350);
        nestButton.center = self.center;
        
    }
    
}
- (void)originalPosition {
     self.topImageView.center = CGPointMake(self.center.x, 40+25);
    self.bottomImageView.center = CGPointMake(self.center.x, SCREEN_HEIGHT - 40 -25);
    self.originCenter = self.bottomImageView.center;
}
@end
