//
//  BFAdvertisementView.m
//  BFAdvertisementDemo
//
//  Created by Readboy_BFAlex on 16/9/21.
//  Copyright © 2016年 BF. All rights reserved.
//

#import "BFAdvertisementView.h"

@interface BFAdvertisementView () {
    int _seconds;
    NSTimer *_timer;
}
@property (weak, nonatomic) IBOutlet UIButton *secondsBtn;

@end

@implementation BFAdvertisementView

+ (instancetype)advertisementView {
    return [[[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@", [self class]] owner:nil options:nil] lastObject];
}

+ (instancetype)advertisementViewWithFrame:(CGRect)frame {
    BFAdvertisementView *adView = [self advertisementView];
    if (adView) {
        adView.frame = frame;
        [adView setupAdvertisementView];
    }
    
    return adView;
}

- (void)setupAdvertisementView {
    _seconds = 10;
    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateSeconds) userInfo:nil repeats:YES];
    [_timer fire];
}

- (void)closeAdvertisementView {
    [self removeFromSuperview];
}

- (void)updateSeconds {
    
    NSString *infoStr = [NSString stringWithFormat:@"点击此处关闭 %d 秒", _seconds];
    [self.secondsBtn setTitle:infoStr forState:UIControlStateNormal];
    
    if (--_seconds < 0) {[_timer invalidate];}
}

- (IBAction)clickCloseBtn:(UIButton *)sender {
    [self closeAdvertisementView];
}

@end
