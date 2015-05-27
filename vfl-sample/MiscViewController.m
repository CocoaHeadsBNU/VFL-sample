//
//  MiscViewController.m
//  vfl-sample
//
//  Created by Alécio José Gomes Neto on 26/05/15.
//  Copyright (c) 2015 CocoaHeads. All rights reserved.
//

#import "MiscViewController.h"
#import "UIView+Autolayout.h"
#import "UIColor+Chameleon.h"

@implementation MiscViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Misc";
    }
    return self;
}

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button1 = [UIButton autolayoutView];
    [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor flatTealColor]];
    [self.view addSubview:button1];

    UIButton *button2 = [UIButton autolayoutView];
    [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor flatPlumColor]];
    [self.view addSubview:button2];

    NSDictionary *views = NSDictionaryOfVariableBindings(button1, button2);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button1(button2)]-[button2]-|"
                                                                      options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                                                                      metrics:nil
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button1]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];


    UIView *containerView = [UIView autolayoutView];
    containerView.backgroundColor = [UIColor flatYellowColor];
    containerView.layoutMargins = UIEdgeInsetsMake(50, 30, 50, 30);
    [self.view addSubview:containerView];

    UIView *innerView = [UIView autolayoutView];
    innerView.backgroundColor = [UIColor flatRedColor];
    [containerView addSubview:innerView];

    UIView *centerView = [UIView autolayoutView];
    centerView.backgroundColor = [UIColor flatBlueColor];
    [innerView addSubview:centerView];

    views = NSDictionaryOfVariableBindings(button1, button2, containerView, innerView, centerView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[containerView]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button1]-[containerView]-20-|" options:0 metrics:nil views:views]];

    [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[innerView]-|" options:0 metrics:nil views:views]];
    [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[innerView]-|" options:0 metrics:nil views:views]];

    [innerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=0)-[centerView(30)]-(>=0)-|" options:0 metrics:0 views:views]];
    [innerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[centerView(50)]" options:0 metrics:0 views:views]];

    [innerView addConstraint:[NSLayoutConstraint constraintWithItem:centerView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:innerView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
}

@end
