//
//  KPAMainViewController.m
//  KPAKitProject
//
//  Created by Kenneth Parker Ackerson on 6/17/14.
//  Copyright (c) 2014 Kenneth Parker Ackerson. All rights reserved.
//

#import "KPAMainViewController.h"
#import "UIView+KPAKit.h"
#import "KPAView.h"
#import "KPATreeNode.h"
#import "KPAKitGeometryFunctions.h"

@interface KPAMainViewController ()

@end

@implementation KPAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KPAView *view = [[KPAView alloc] initWithFrame:CGRectMake(0, 0, 75, 75)];
    [self.view addSubview:view];
    [view setBackgroundColor:[UIColor greenColor]];
    
    __weak KPAView *weakView = view;
    __weak KPAViewController *weakSelf = self;

    [self.kpa_view setBoundsChangeBlock:^ {
        [weakView kpa_resizeBoundsInRelationToView:weakSelf.view withPercentage:KPA2dValueMake(0.5, 0.5)];
        [weakView kpa_positionViewWithPercentage:KPA2dValueMake(0.5, 0.5) doesAllowEscapingViewBounds:NO];
        [weakView kpa_moveByAmount:CGPointMake(CGRectGetWidth(weakView.frame)/2.f, 0)];
    }];
    
    KPATreeNode *rootNode = [KPATreeNode treeNodeWithDataObject:[NSObject new]];
    KPATreeNode *nNode = rootNode;

    for (NSInteger i = 1; i <= 10000; i++) {
        KPATreeNode *n = [KPATreeNode treeNodeWithDataObject:[NSObject new]];
        [nNode addChild:n];
        if (arc4random_uniform(500) < 150) {
            nNode = n;
        }
    }

    [rootNode enumerateAllDescendingNodesWithBlock:^(KPATreeNode *object) {}];

    //  [view kpa_pinViewToView:self.view positionWithPercentagePoint:KPA2dValueMake(0.5, 0.5)];
    //[view removeFromSuperview];
    // view = nil;
}

@end
