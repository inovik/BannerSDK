//
//  TTStarView.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 02.06.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTStarView.h"

NSInteger const kStarWidth = 7;
NSInteger const kStarHeight = 7;

@implementation TTStarView

- (instancetype)initWithRate:(CGFloat)rate andFrame:(CGRect)rect{
    if ( self == [super init] )
    {
        //backgroundView
        UIView* backgroundStarsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
        for (NSInteger i = 0; i < 5; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0 + (rect.size.width/5)*i, 0, rect.size.width/5, rect.size.height)];
            UIImage *starImage = [UIImage imageNamed:@"starIcon"];
            imageView.image = starImage;
            [backgroundStarsView addSubview:imageView];
        }
        [self addSubview:backgroundStarsView];
        
        //rated view
        CGFloat rateWidth = rate/5.0;
        UIView* ratedStarsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width*rateWidth, rect.size.height)];
        for (NSInteger i = 0; i < 5; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0 + (rect.size.width/5)*i, 0, rect.size.width/5, rect.size.height)];
            UIImage *starImage = [UIImage imageNamed:@"starIconBlack"];
            imageView.image = starImage;
            [ratedStarsView addSubview:imageView];
        }
        
        ratedStarsView.clipsToBounds=YES;
        [self addSubview:ratedStarsView];
    }
    return self;
}
@end
