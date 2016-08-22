//
//  ViewController.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "ViewController.h"
#import "TTMyTargetSDK.h"


@interface ViewController ()

@property (nonatomic, strong)id<TTMyTargetSDKProtocol> myTargetSDK;

@end

@implementation ViewController

-(id<TTMyTargetSDKProtocol>)myTargetSDK{
    if ( !_myTargetSDK )
    {
        _myTargetSDK = [TTMyTargetSDK new];
    }
    
    return _myTargetSDK;
}

- (IBAction)loadBunnerButtonAction:(id)sender {
    NSArray *array = [self.containerViewForBunner subviews];
    for (UIView *view in array) {
        [view removeFromSuperview];
    }
    
    [self.myTargetSDK obtainBannerWithContainerView:self.containerViewForBunner];
}
@end
