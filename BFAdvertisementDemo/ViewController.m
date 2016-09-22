//
//  ViewController.m
//  BFAdvertisementDemo
//
//  Created by Readboy_BFAlex on 16/9/20.
//  Copyright © 2016年 BF. All rights reserved.
//

#import "ViewController.h"
#import "BFPreView.h"
#import "BFAdvertisementView.h"

@interface ViewController () {
    BFPreView *_preview;
    BFAdvertisementView *_adView;
    
    NSTimer *_timer;
}
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setupView {
    int rdm = arc4random()%2;
    NSLog(@"random number: %d", rdm);
    switch (rdm) {
        case 0:
            [self setupPreView];
            break;
            
        case 1:
            [self setupAdvertisementView];
            break;
            
        default:
            break;
    }
}

- (void)setupPreView {
    NSLog(@"%s", __func__);
    
    _preview = [BFPreView preViewWithFrame:self.view.frame];
    [self.view insertSubview:_preview belowSubview:self.updateBtn];
}

- (void)setupAdvertisementView {
    NSLog(@"%s", __func__);
    
    _adView = [BFAdvertisementView advertisementViewWithFrame:self.view.frame];
    [self.view insertSubview:_adView belowSubview:self.updateBtn];
}

- (IBAction)clickUpdateBtn:(UIButton *)sender {
    if (_preview) {
        [_preview removeFromSuperview];
    }
    
    if (_adView) {
        [_adView removeFromSuperview];
    }
    
    [self setupView];
}

- (IBAction)clickRemoveBtn:(UIButton *)sender {
    if (_preview) {
        [_preview removeFromSuperview];
        _preview = nil;
    }
    
    if (_adView) {
        [_adView removeFromSuperview];
        _adView = nil;
    }
}

@end
