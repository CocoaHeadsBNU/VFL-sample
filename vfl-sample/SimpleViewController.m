//
//  ViewController.m
//  vfl-sample
//
//  Created by Alécio José Gomes Neto on 26/05/15.
//  Copyright (c) 2015 CocoaHeads. All rights reserved.
//

#import "SimpleViewController.h"
#import "UIView+Autolayout.h"
#import "UIColor+Chameleon.h"

@implementation SimpleViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Simple";
    }
    return self;
}

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor whiteColor];

    UILabel *label1 = [UILabel autolayoutView];
    label1.backgroundColor = [UIColor flatRedColor];
    label1.text = @"I'm a label!";
    [self.view addSubview:label1];

    UILabel *label2 = [UILabel autolayoutView];
    label2.backgroundColor = [UIColor flatOrangeColor];
    label2.text = @"I'm another label!";
    label2.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:label2];

    NSDictionary *views = NSDictionaryOfVariableBindings(label1, label2);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label1]-|"
                                                                      options:0 metrics:0 views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label2]-|"
                                                                      options:0 metrics:0 views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(40)-[label1]-[label2]"
                                                                      options:0 metrics:0 views:views]];
}

@end
