//
//  TTMyTargetSDK.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTMyTargetSDK.h"
#import "TTTransportService.h"
#import "TTMappingService.h"
#import "TTBannerView.h"

static NSString * const kDownloadURLString = @"https://ad.mail.ru/mobile/6591";

@interface TTMyTargetSDK ()

@property (nonatomic, strong)id<TTTransportServiceProtocol> transportService;
@property (nonatomic, strong)id<TTMappingServiceProtocol> mappingService;

@end

@implementation TTMyTargetSDK

- (void)obtainBannerWithContainerView:(UIView *)containerView{
    
    NSURL *downloadURL = [NSURL URLWithString:kDownloadURLString];
    
    TTBannerView *bannerView = [[TTBannerView alloc] initInContainer:containerView];
    
    [self.transportService obtainJsonModelFromURL:downloadURL withSucces:^(id jsonObject) {
        
        id<TTBaseBannerModelProtocol> bannerModel = [self.mappingService modelOfClass:[TTBaseBannerModel class] fromJSONDictionary:jsonObject];
        
        [bannerView updateViewWithModel:bannerModel];
        
    } andFailure:^(NSError *error) {
        NSLog(@"error %@", error.localizedDescription);
    }];
}

- (id<TTTransportServiceProtocol>)transportService{
    if ( !_transportService )
    {
        _transportService = [TTTransportService new];
    }
    return _transportService;
}

- (id<TTMappingServiceProtocol>)mappingService{
    if ( !_mappingService )
    {
        _mappingService = [TTMappingService new];
    }
    return _mappingService;
}

@end
