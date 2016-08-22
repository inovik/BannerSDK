//
//  TTBaseBannerModel.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTBaseBannerModel.h"

NSString * const kTypeWeb = @"web";
NSString * const kTypeApplication = @"store";

@implementation TTBaseBannerModel

@synthesize bannerTitle, bannerDescription,ageRestrictions,icon, advertisingLabel, navigationType, rating, votes, domain;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             NSStringFromSelector(@selector(ageRestrictions)) : @"banners.ageRestrictions",
             NSStringFromSelector(@selector(advertisingLabel)) : @"settings.advertisingLabel",
             NSStringFromSelector(@selector(bannerTitle)) : @"banners.title",
             @"icon.iconLink" : @"banners.iconLink",
             @"icon.iconWidth" : @"banners.iconWidth",
             @"icon.iconHeight" : @"banners.iconHeight",
             NSStringFromSelector(@selector(bannerDescription)) : @"banners.description",
             NSStringFromSelector(@selector(navigationType)) : @"banners.navigationType",
             NSStringFromSelector(@selector(domain)) : @"banners.domain",
             NSStringFromSelector(@selector(rating)) : @"banners.rating",
             NSStringFromSelector(@selector(votes)) : @"banners.votes",
             };
}

+ (Class)iconClass {
    return [TTIconModel class];
}

+ (NSNumber *)navigationTypeTransform:(NSString *)navigationTypeString {
    if ([navigationTypeString isEqualToString:kTypeWeb]) {
        return @(TTBannerNavigatinTypeWeb);
    } else if ([navigationTypeString isEqualToString:kTypeApplication]) {
        return @(TTBannerNavigatinTypeApplication);
    }
    
    return nil;
}

@end
