//
//  KPAPinnableView.h
//  KPAKit
//
//  Created by Kenneth Parker Ackerson on 5/19/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPAKitDefinitions.h"

/** WARNING 
    
    This class is very beta and is mostly a playground for a potential future version that does much more.
 
 **/

@interface KPAPinnableView : UIView

- (void)kpa_pinViewToView:(UIView *)view positionWithPercentagePoint:(KPA2dValue)percentage;

- (void)kpa_stopPinning;

@end
