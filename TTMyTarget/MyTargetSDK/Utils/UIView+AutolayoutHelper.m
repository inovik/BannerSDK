//
//  UIView+AutolayoutHelper.m
//  TTTT
//
//  Created by Ivan Novikov on 01.06.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "UIView+AutolayoutHelper.h"

@implementation UIView (AutolayoutHelper)

- (void)addSubview:(UIView *)subView
withLeftToSuperView:(CGFloat)left
 andTopToSuperView:(CGFloat)top{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:subView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subView
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.
                                                      constant:left]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.
                                                      constant:top]];
}

- (void)addSubview:(UIView *)subView
withRightToSuperView:(CGFloat)right
 andTopToSuperView:(CGFloat)top{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:subView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                        toItem:subView
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.
                                                      constant:right]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.
                                                      constant:top]];
}


- (void)addConstraintWidth:(CGFloat)width{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.
                                                      constant:width]];
}

- (void)addConstraintHeight:(CGFloat)height{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.
                                                      constant:height]];
}

- (void)addOriginSizeConstraints:(CGSize)size{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.
                                                      constant:size.width]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.
                                                      constant:size.height]];
}

- (void)addRightConstraint:(CGFloat)right fromView:(UIView *)subView toView:(UIView *)targetView{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subView
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:targetView
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.
                                                      constant:-right]];
}

- (void)addSubview:(UIView *)subview
    withLeftMargin:(CGFloat)left
       rightMargin:(CGFloat)right
         topMargin:(CGFloat)top
      bottomMargin:(CGFloat)bottom{
    
    [subview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:subview];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1.
                                                      constant:left]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.
                                                      constant:right]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.
                                                      constant:top]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.
                                                      constant:bottom]];
}

@end
