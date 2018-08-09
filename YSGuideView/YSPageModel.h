//
//  YSPageModel.h
//  YSGuideView
//
//  Created by 罗罗诺亚索隆 on 2018/8/6.
//  Copyright © 2018年 mianduijifengba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSPageModel : NSObject
@property (nonatomic,strong) NSString *bgimageName;
@property (nonatomic,strong) NSString *topimageName;
@property (nonatomic,strong) NSString *bottomImageName;
@property (nonatomic,assign) float topMargin;
@property (nonatomic,assign) float bottomMargin;
@property (nonatomic,assign) float imageWidth;
@end
