//
//  TTBannerUI.h
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTBaseBannerModel.h"

@interface TTBannerView : UIView

- (instancetype)initInContainer:(UIView *)containerView;

- (void)updateViewWithModel:(id<TTBaseBannerModelProtocol>)bannerModel;

@end
