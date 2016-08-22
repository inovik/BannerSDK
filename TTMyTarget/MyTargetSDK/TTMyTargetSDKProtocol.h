//
//  TTMyTargetSDKProtocol.h
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TTMyTargetFailureBlock)(NSError *error);
typedef void(^TTMyTargetSuccesBlock)(UIView *bannerView);

@protocol TTMyTargetSDKProtocol <NSObject>

/*!
 *  Load banner in container view
 *  container view must be without height constraint
 *
 *  @param containerView view where banner will be shown
 */
- (void)obtainBannerWithContainerView:(UIView *)containerView;

@end
