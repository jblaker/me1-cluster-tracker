//
//  WebViewController.h
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController {
  UIWebView *_webView;
}

@property (nonatomic, retain) NSString *urlToLoad;

@end
