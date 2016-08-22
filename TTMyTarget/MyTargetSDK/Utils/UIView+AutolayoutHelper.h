//
//  UIView+AutolayoutHelper.h
//  TTTT
//
//  Created by Ivan Novikov on 01.06.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AutolayoutHelper)

- (void)addSubview:(UIView *)subView
        withLeftToSuperView:(CGFloat)left
          andTopToSuperView:(CGFloat)top;

- (void)addSubview:(UIView *)subView
        withRightToSuperView:(CGFloat)right
           andTopToSuperView:(CGFloat)top;

- (void)addConstraintWidth:(CGFloat)width;

- (void)addConstraintHeight:(CGFloat)height;

- (void)addOriginSizeConstraints:(CGSize)size;

//- (void)addLeftConstraint:(CGFloat)left fromView:(UIView *)subView toView:(UIView *)targetView;
//
//- (void)addLeftConstraint:(CGFloat)left toSuperView:(UIView *)superView;
//
- (void)addRightConstraint:(CGFloat)right fromView:(UIView *)subView toView:(UIView *)targetView;
//
//- (void)addRightConstraint:(CGFloat)right toSuperView:(UIView *)superView;
//
//- (void)addTopConstraint:(CGFloat)top fromView:(UIView *)subView toView:(UIView *)targetView;
//
//- (void)addTopConstraint:(CGFloat)top toSuperView:(UIView *)superView;

-(void)addSubview:(UIView *)subview
   withLeftMargin:(CGFloat)left
      rightMargin:(CGFloat)right
        topMargin:(CGFloat)top
     bottomMargin:(CGFloat)bottom;

@end
