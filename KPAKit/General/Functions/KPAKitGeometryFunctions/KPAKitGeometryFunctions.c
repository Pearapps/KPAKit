//
//  KPAKitGeometryFunctions.c
//  KPAKit
//
//  Created by Kenneth Parker Ackerson on 6/18/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import "KPAKitGeometryFunctions.h"

CGSize kpa_sizeByAddingSizes(CGSize size, CGSize otherSize) {
    return CGSizeMake(size.width + otherSize.width, size.height + otherSize.height);
}