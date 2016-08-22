//
//  TTBannerUI.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTBannerView.h"
#import "UIView+AutolayoutHelper.h"
#import "TTBannerDescriptionViewWeb.h"
#import "TTBannerDescriptionViewApp.h"
#import "TTStarView.h"
#import "TTTransportService.h"

NSInteger const kTopInset = 10;
NSInteger const kLeftInset = 10;
NSInteger const kRightInset = 10;

@interface TTBannerView ()
@property (nonatomic, strong)id<TTTransportServiceProtocol> transportService;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, weak) UIView *containerForBanner;

@end

@implementation TTBannerView

- (instancetype)initInContainer:(UIView *)containerView{
    if ( self == [super init] )
    {
        self.containerForBanner = containerView;
        self.indicatorView.frame = containerView.bounds;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 1.;
        self.layer.cornerRadius = 10;
        
            dispatch_async(dispatch_get_main_queue(), ^{
                [self addSubview:self.indicatorView];
                [self.containerForBanner addSubview:self withLeftMargin:0 rightMargin:0 topMargin:0 bottomMargin:0];
                [self.containerForBanner layoutSubviews];
                [_indicatorView startAnimating];
            });
    
    }
    return self;
}

- (void)updateViewWithModel:(id<TTBaseBannerModelProtocol>)bannerModel{
   
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //remove indicator view
        [self.indicatorView stopAnimating];
        [self.indicatorView removeFromSuperview];
        self.indicatorView = nil;
        self.containerForBanner.backgroundColor = [UIColor whiteColor];
        
        [self configureViewWithModel:bannerModel];
    });
    
}

- (UIActivityIndicatorView *)indicatorView{
    if ( !_indicatorView )
    {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _indicatorView;
}

#pragma mark Configure input views

- (void)configureViewWithModel:(id<TTBaseBannerModelProtocol>)bannerModel{
    UILabel *ageRestrictionsLabel = [[UILabel alloc] init];
    ageRestrictionsLabel.text = [bannerModel ageRestrictions];
    ageRestrictionsLabel.textAlignment = NSTextAlignmentCenter;
    ageRestrictionsLabel.textColor = [UIColor grayColor];
    ageRestrictionsLabel.font = [UIFont systemFontOfSize:14];
    ageRestrictionsLabel.layer.borderWidth = 1;
    ageRestrictionsLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [ageRestrictionsLabel sizeToFit];

    [self addSubview:ageRestrictionsLabel withLeftToSuperView:kLeftInset andTopToSuperView:kTopInset];
    CGSize size = ageRestrictionsLabel.frame.size;
    size.width += 6.f;
    size.height += 4.f;
    [ageRestrictionsLabel addOriginSizeConstraints:size];
    
    UILabel *advertisingLabel = [[UILabel alloc] init];
    advertisingLabel.text = [bannerModel advertisingLabel];
    advertisingLabel.textColor = [UIColor grayColor];
    advertisingLabel.font = [UIFont systemFontOfSize:14];
    advertisingLabel.numberOfLines = 0;
    
    [self addSubview:advertisingLabel withRightToSuperView:kRightInset andTopToSuperView:kTopInset];
    [self addRightConstraint:kRightInset fromView:ageRestrictionsLabel toView:advertisingLabel];
    
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[bannerModel icon] iconWidth]/2, [[bannerModel icon] iconHeight]/2)];
    [self addSubview:iconImageView];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self downloadImageFromUrl:[[bannerModel icon] iconLink] withCompletition:^(UIImage *downloadedImage) {
            dispatch_async(dispatch_get_main_queue(), ^{
                iconImageView.image = downloadedImage;
            });
            
        }];
        
    });
    

    [self addConstraint:[NSLayoutConstraint constraintWithItem:iconImageView
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:kLeftInset]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:iconImageView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:ageRestrictionsLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:kTopInset]];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:iconImageView
                                                    attribute:NSLayoutAttributeBottom
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeBottom
                                                   multiplier:1.
                                                     constant:-kTopInset];
    
    bottomConstraint.priority = 250;
    [self addConstraint:bottomConstraint];
    
    [iconImageView addOriginSizeConstraints:iconImageView.frame.size];
    

    UILabel *bannerTitleLabel = [[UILabel alloc] init];
    bannerTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    bannerTitleLabel.numberOfLines = 0;
    bannerTitleLabel.text = [bannerModel bannerTitle];
    bannerTitleLabel.font = [UIFont systemFontOfSize:16 weight:1];
    bannerTitleLabel.textColor = [UIColor blackColor];
   
    [self addSubview:bannerTitleLabel];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bannerTitleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:advertisingLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.
                                                      constant:kTopInset]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bannerTitleLabel
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:iconImageView
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.
                                                      constant:kRightInset]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bannerTitleLabel
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.
                                                      constant:-kRightInset]];
    

    //if bunner type
    UIView *viewDescription;
    if ( [bannerModel navigationType] == TTBannerNavigatinTypeWeb )
    {
        viewDescription = [[TTBannerDescriptionViewWeb alloc] initWithModel:bannerModel];
    }
    else if ([bannerModel navigationType] == TTBannerNavigatinTypeApplication)
    {
        viewDescription = [[TTBannerDescriptionViewApp alloc] initWithModel:bannerModel];
    }
    
    viewDescription.translatesAutoresizingMaskIntoConstraints = NO;
    [viewDescription sizeToFit];
    
    [self addSubview:viewDescription];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:viewDescription
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:bannerTitleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.
                                                      constant:kTopInset/2]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:viewDescription
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:iconImageView
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.
                                                      constant:kLeftInset]];
    
    [viewDescription addOriginSizeConstraints:viewDescription.frame.size];
    
    UILabel *bannerTextLabel = [[UILabel alloc] init];
    bannerTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    bannerTextLabel.numberOfLines = 0;
    bannerTextLabel.text = [bannerModel bannerDescription];
    bannerTextLabel.font = [UIFont systemFontOfSize:15 weight:0];
    bannerTextLabel.textColor = [UIColor blackColor];
    
    [self addSubview:bannerTextLabel];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bannerTextLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:viewDescription
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.
                                                      constant:kTopInset*2]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bannerTextLabel
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:iconImageView
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.
                                                      constant:kLeftInset]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bannerTextLabel
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.
                                                      constant:-kRightInset]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:bannerTextLabel
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.
                                                      constant:-kTopInset]];
    
    
    
    [self.containerForBanner layoutSubviews];
    
}

- (void)downloadImageFromUrl:(NSString *)linkString withCompletition:(void(^)(UIImage *downloadedImage))completionBlock {
    [self.transportService obtainImageFromURL:[NSURL URLWithString:linkString] withSucces:^(id object) {
        UIImage *image = [UIImage imageWithData:object];
        completionBlock(image);
    } andFailure:nil];
}

- (id<TTTransportServiceProtocol>)transportService{
    if ( !_transportService )
    {
        _transportService = [TTTransportService new];
    }
    return _transportService;
}



@end
