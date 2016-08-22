//
//  TTBannerDescriptionViewApp.h
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTBaseBannerModel.h"
@interface TTBannerDescriptionViewApp : UIView

- (instancetype)initWithModel:(id<TTBaseBannerModelProtocol>)model;

@end
