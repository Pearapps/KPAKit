//
//  KPAPinnableView.m
//  KPAKit
//
//  Created by Kenneth Parker Ackerson on 5/19/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import "KPAPinnableView.h"
#import "UIView+KPAKit.h"

@interface KPAPinnableView  ()

@property (nonatomic, assign) KPA2dValue percentage;
@property (nonatomic, weak) UIView *referenceView;
@property (nonatomic, assign) BOOL isObserving;
@property (nonatomic, assign) BOOL isPinning;

@end

@implementation KPAPinnableView

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.referenceView && [keyPath isEqualToString:@"bounds"]) {
        if (self.isPinning) {
            [self kpa_positionViewInView:self.referenceView withPercentage:self.percentage doesAllowEscapingViewBounds:NO];
        }  
    }
}

- (void)kpa_pinViewToView:(UIView *)view positionWithPercentagePoint:(KPA2dValue)percentage {
    self.percentage = percentage;
    self.referenceView = view;
    [self kpa_startObserving];
    self.isPinning = YES;
}

- (void)kpa_stopPinning {
    if (self.isPinning) {
        self.isPinning = NO;
    }
}

#pragma mark - Private -

- (void)kpa_startObserving {
    if (!self.isObserving) {
        self.isObserving = YES;
        [self.referenceView addObserver:self forKeyPath:@"bounds" options:0 context:nil];
    }
}

- (void)kpa_stopObserving {
    if (self.isObserving) {
        self.isObserving = NO;
        [self.referenceView removeObserver:self forKeyPath:@"bounds"];
    }
}

- (void)removeFromSuperview {
    [self kpa_stopObserving];
    [super removeFromSuperview];
}

@end
