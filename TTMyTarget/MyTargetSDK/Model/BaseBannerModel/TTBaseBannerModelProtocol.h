//
//  TTBaseBannerModelProtocol.h
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TTIconModel.h"

@protocol TTBaseBannerModelProtocol <NSObject>

typedef NS_ENUM(NSInteger, TTBannerNavigatinType){
    TTBannerNavigatinTypeWeb,
    TTBannerNavigatinTypeApplication
};

@property (nonatomic, strong) NSString *ageRestrictions;
@property (nonatomic, strong) NSString *advertisingLabel;
@property (nonatomic, strong) NSString *bannerTitle;
@property (nonatomic, strong) id<TTIconModelProtocol> icon;
@property (nonatomic, strong) NSString *bannerDescription;
@property (nonatomic, assign) TTBannerNavigatinType navigationType;

@property (nonatomic, assign) CGFloat rating;
@property (nonatomic, assign) NSInteger votes;
@property (nonatomic, strong) NSString *domain;

@end
