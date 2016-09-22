//
//  BFPreView.h
//  BFAdvertisementDemo
//
//  Created by Readboy_BFAlex on 16/9/20.
//  Copyright © 2016年 BF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BFPreView : UIView <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControlView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

+ (instancetype)preView;
+ (instancetype)preViewWithFrame:(CGRect)frame;

@end
