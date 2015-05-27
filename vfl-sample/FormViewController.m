//
//  FormViewController.m
//  vfl-sample
//
//  Created by Alécio José Gomes Neto on 26/05/15.
//  Copyright (c) 2015 CocoaHeads. All rights reserved.
//

#import "FormViewController.h"
#import "UIView+Autolayout.h"
#import "UIColor+Chameleon.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Form";
    }
    return self;
}

- (void)loadView {
    self.view = [UIView new];
    self.view.backgroundColor = [UIColor whiteColor];

    self.userField = [UITextField autolayoutView];
    self.userField.placeholder = @"Username";
    self.userField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.userField];

    self.passwordField = [UITextField autolayoutView];
    self.passwordField.placeholder = @"Password";
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.passwordField];

    self.actionButton = [UIButton autolayoutView];
    self.actionButton.backgroundColor = [UIColor flatGreenColor];
    [self.actionButton setTitle:@"Send" forState:UIControlStateNormal];
    self.actionButton.layer.cornerRadius = 5;
    [self.view addSubview:self.actionButton];

    NSDictionary *views = NSDictionaryOfVariableBindings(_userField, _passwordField, _actionButton);
    NSDictionary *metrics = @{@"fieldHeight": @35, @"buttonHeight": @40};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_userField]-|"
                                                                      options:0 metrics:0 views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_passwordField]-|"
                                                                      options:0 metrics:0 views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_actionButton]-|"
                                                                      options:0 metrics:0 views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_userField(fieldHeight)]-[_passwordField(fieldHeight)]-[_actionButton(buttonHeight)]"
                                                                      options:0 metrics:metrics views:views]];
}

@end
