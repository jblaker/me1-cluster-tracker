//
//  WebViewController.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

@synthesize urlToLoad=_urlToLoad;

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupDismissButton];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlToLoad]]];
}

- (void)setupDismissButton {
  UIBarButtonItem *dismissBtn = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(dismissSelf:)];
  [[self navigationItem] setRightBarButtonItem:dismissBtn];
}

- (void)dismissSelf:(id)sender {
  [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
