//
//  BFPreView.m
//  BFAdvertisementDemo
//
//  Created by Readboy_BFAlex on 16/9/20.
//  Copyright © 2016年 BF. All rights reserved.
//

#import "BFPreView.h"

@implementation BFPreView 

+ (instancetype)preView {
    
    BFPreView *preView = [[[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@", [self class]] owner:nil options:nil] lastObject];
    
    return preView;
}

+ (instancetype)preViewWithFrame:(CGRect)frame {
    BFPreView *preView = [self preView];
    if (preView) {
        preView.frame = frame;
        [preView setupScrollViewWithFrame:frame];
    }
    
    NSLog(@"view : %@", preView);
    return preView;
}

- (IBAction)clickPageControlView:(UIPageControl *)sender {
    NSLog(@"current page : %zd", sender.currentPage);
    CGSize winSize = self.bounds.size;
    CGRect visiRect = CGRectMake(winSize.width * sender.currentPage, 0, winSize.width, winSize.height);
    [self.contentScrollView scrollRectToVisible:visiRect animated:YES];
}

- (void)setupScrollViewWithFrame:(CGRect)frame {
    NSLog(@"num: %zd", self.pageControlView.numberOfPages);
    
    CGSize svSize = frame.size;
    self.contentScrollView.contentSize = CGSizeMake(svSize.width * self.pageControlView.numberOfPages, svSize.height);
    
    for (int i = 0; i < self.pageControlView.numberOfPages; i++) {
        NSString *imageName = [NSString stringWithFormat:@"ans_num_%d", i];
        UIImage *image = [UIImage imageNamed:imageName];
        CGRect ivFrame = CGRectMake(svSize.width * i, 0, svSize.width, svSize.height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:ivFrame];
        imageView.image = image;
        [self.contentScrollView addSubview:imageView];
    }
    
    self.contentScrollView.delegate = self;
}

- (void)adjustScrollViewVisiableRect:(CGPoint)offset {
    float centerX = offset.x + self.bounds.size.width/2;
    int num = centerX / self.bounds.size.width;
    
    CGSize winSize = self.bounds.size;
    CGRect visiRect = CGRectMake(winSize.width * num, 0, winSize.width, winSize.height);
    [self.contentScrollView scrollRectToVisible:visiRect animated:YES];
    
    self.pageControlView.currentPage = num;
}

- (NSString *)description {
    NSString *frameDesc = [NSString stringWithFormat:@"(x:%f, y:%f, w:%f, h:%f)",
                           self.frame.origin.x,
                           self.frame.origin.y,
                           self.frame.size.width,
                           self.frame.size.height];
    
    return frameDesc;
}

#pragma mark - delegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self adjustScrollViewVisiableRect:scrollView.contentOffset];
}

@end
