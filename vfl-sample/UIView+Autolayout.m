//
//  UIView+Autolayout.m
//  vfl-sample
//
//  Created by Alécio José Gomes Neto on 26/05/15.
//  Copyright (c) 2015 CocoaHeads. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

+ (id)autolayoutView {
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

@end
