//
//  TTBannerDescriptionViewWeb.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTBannerDescriptionViewWeb.h"
#import "UIView+AutolayoutHelper.h"

@implementation TTBannerDescriptionViewWeb

- (instancetype)initWithModel:(id<TTBaseBannerModelProtocol>)model{
    if ( self == [super init] )
    {
        UILabel *domainLabel = [[UILabel alloc] init];
        domainLabel.textColor = [UIColor lightGrayColor];
        domainLabel.text = [model domain];
        domainLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:domainLabel];
        [domainLabel sizeToFit];
    }
    return self;
}

@end
