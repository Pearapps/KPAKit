//
//  KPAKitDefinitions.h
//  KPAKit
//
//  Created by Kenneth Parker Ackerson on 5/28/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <objc/NSObjCRuntime.h>
// Blocks

typedef void (^KPABlock)();
typedef void (^KPAObjectBlock)(id object);
typedef void (^KPAPointerBlock)(void *x);

typedef void (^KPABoundsBlock)(CGRect bounds);
typedef void (^KPAIntegerBlock)(NSInteger i);

// Geometry

typedef struct {
    CGFloat x, y;
} KPA2dValue;

#define KPA2dValueMake(x, y) (KPA2dValue){x, y}