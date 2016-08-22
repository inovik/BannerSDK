//
//  TTBannerDescriptionViewApp.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTBannerDescriptionViewApp.h"
#import "TTStarView.h"

NSInteger const kLeftMargin = 10;
@implementation TTBannerDescriptionViewApp

- (instancetype)initWithModel:(id<TTBaseBannerModelProtocol>)model{
    if ( self == [super init] )
    {
        //configure votes label
        UILabel *votesLabel = [[UILabel alloc] init];
        votesLabel.text = [NSString stringWithFormat:@"%d", [model votes]];
        votesLabel.font = [UIFont systemFontOfSize:12];
        [votesLabel sizeToFit];
        
        //configure stars view
        CGFloat height = votesLabel.frame.size.height;
        TTStarView *viewStar = [[TTStarView alloc] initWithRate:[model rating] andFrame:CGRectMake(0, 0, height*5, height)];
        viewStar.frame = CGRectMake(0, 0, height*5, height);
        [self addSubview:viewStar];

        CGRect viewStarFrame = viewStar.frame;
        CGRect votesLabelFrame = votesLabel.frame;
        votesLabelFrame.origin.x = viewStarFrame.origin.x + viewStarFrame.size.width + kLeftMargin;
        votesLabelFrame.origin.y = votesLabelFrame.origin.y;
        votesLabel.frame = votesLabelFrame;
        [self addSubview:votesLabel];
    }
    return self;
}

@end
