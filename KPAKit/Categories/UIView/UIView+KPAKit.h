//
//  UIView+KPAKit.h
//  KPAKit
//
//  Created by Kenneth Parker Ackerson on 5/19/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPAKitDefinitions.h"

@interface UIView (KPAKit)

/**
 * @param size The size to change the view's bound's size too.
 * @discussion This method will change the view's bound's size too.
 */
- (void)kpa_modifyBoundsSize:(CGSize)size;

/**
 * @param view The view the bounds resize to be in relation to.
 * @param percentage The percentage of the view to size the bounds as.
 * @discussion This will resize the view's bounds in relation to the passed view.
 */
- (void)kpa_resizeBoundsInRelationToView:(UIView *)view withPercentage:(KPA2dValue)percentage;

/**
 *
 * @discussion This method is used to position a view in another based relatively on the bounds of the view passed in. Basically the center as a percentage of the paramater view's bounds.
 * @param view This is the view that this view will be positioned relative too.
 * @param percentage This is a 2d value but should be between 0 and 1. Simply, it will multiply the values of the param view's bounds to get a center for this view. So {0.5, 0.5} will be the center of the paramater view
 * @param doesAllowEscapingViewBounds This determines whether or not this view can escape the view passed in as the parameter view's bound
 */
- (void)kpa_positionViewInView:(UIView *)view withPercentage:(KPA2dValue)percentage doesAllowEscapingViewBounds:(BOOL)doesAllowEscapingViewBounds;

/**
 * @discussion This calls kpa_positionViewInView:withPercentagePoint: with self.superView as the view param.
 */
- (void)kpa_positionViewWithPercentage:(KPA2dValue)percentage doesAllowEscapingViewBounds:(BOOL)doesAllowEscapingViewBounds;

/**
 * @discussion This moves the center of this view by a given point.
 * @param p The vector to move the view by.
 */
- (void)kpa_moveByAmount:(CGPoint)p;

/**
 * @discussion This will resposition this view to keep all of it inside the paramater view's bounds.
 * @param view This is the view to keep this view inside. 
 */
- (void)kpa_repositionToKeepInView:(UIView *)view;

/**
 * @return This method will return the size of the view's bound.
 */
- (CGSize)kpa_boundsSize;

@end
