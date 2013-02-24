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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      _webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
      [self.view addSubview:_webView];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlToLoad]]];
}

@end
