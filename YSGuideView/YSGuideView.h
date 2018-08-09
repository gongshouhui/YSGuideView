//
//  YSGuideView.h
//  YSGuideView
//
//  Created by 罗罗诺亚索隆 on 2018/8/7.
//  Copyright © 2018年 mianduijifengba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSPageModel.h"
@interface YSGuideView : UIView
@property (nonatomic,copy) void(^nextActionBlock)();
@end
