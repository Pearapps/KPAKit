//
//  UIView+KPAKit.m
//  KPAKit
//
//  Created by Kenneth Parker Ackerson on 5/19/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import "UIView+KPAKit.h"

@implementation UIView (KPAKit)

- (void)kpa_positionViewInView:(UIView *)view withPercentage:(KPA2dValue)percentage doesAllowEscapingViewBounds:(BOOL)doesAllowEscapingViewBounds {
    
    [self setCenter:CGPointMake(CGRectGetWidth(view.bounds) * percentage.x, CGRectGetHeight(view.bounds) * percentage.y)];
    
    if (!doesAllowEscapingViewBounds) {
        [self kpa_repositionToKeepInView:view];
    }
    
}

- (void)kpa_resizeBoundsInRelationToView:(UIView *)view withPercentage:(KPA2dValue)percentage {
    [self kpa_modifyBoundsSize:CGSizeMake(CGRectGetWidth(view.bounds) * percentage.x, CGRectGetHeight(view.bounds) * percentage.y)];
}

- (void)kpa_positionViewWithPercentage:(KPA2dValue)percentage doesAllowEscapingViewBounds:(BOOL)doesAllowEscapingViewBounds {
    [self kpa_positionViewInView:self.superview withPercentage:percentage doesAllowEscapingViewBounds:doesAllowEscapingViewBounds];
}

- (void)kpa_moveByAmount:(CGPoint)p {
    [self setCenter:CGPointMake(self.center.x + p.x, self.center.y + p.y)];
}

- (void)kpa_modifyBoundsSize:(CGSize)size {
    self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, size.width, size.height);
}

- (void)kpa_repositionToKeepInView:(UIView *)view {
    if (self.center.x - CGRectGetWidth(self.bounds)/2.f < view.bounds.origin.x) {
        self.center = CGPointMake(CGRectGetWidth(self.bounds)/2.f, self.center.y);
    } else if (self.center.y - CGRectGetHeight(self.bounds)/2.f < view.bounds.origin.y) {
        self.center = CGPointMake(self.center.x, CGRectGetHeight(self.bounds)/2.f);
    }
    
    if (self.center.x + CGRectGetWidth(self.bounds)/2.f > CGRectGetMaxX(view.bounds)) {
        self.center = CGPointMake(CGRectGetMaxX(view.bounds) - CGRectGetWidth(self.bounds)/2.f, self.center.y);
    } else if (self.center.y + CGRectGetHeight(self.bounds)/2.f > CGRectGetMaxY(view.bounds)) {
        self.center = CGPointMake(self.center.x,  CGRectGetMaxY(view.bounds) - CGRectGetHeight(self.bounds)/2);
    }
}

- (CGSize)kpa_boundsSize {
    return self.bounds.size;
}

@end
