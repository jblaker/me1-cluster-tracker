//
//  BaseTableViewController.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

@synthesize backgroundImageView=_backgroundImageView;

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupBackgroundImage];
}

- (void)setupBackgroundImage {
  [[self tableView] setBackgroundColor:[UIColor clearColor]];
  
  [_backgroundImageView setImage:[UIImage imageNamed:@"dawn"]];
  [_backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
  
  UIInterpolatingMotionEffect *interpolationHorizontal = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
  interpolationHorizontal.minimumRelativeValue = @-40.0;
  interpolationHorizontal.maximumRelativeValue = @40.0;
  
  UIInterpolatingMotionEffect *interpolationVertical = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
  interpolationVertical.minimumRelativeValue = @-40.0;
  interpolationVertical.maximumRelativeValue = @40.0;
  
  [_backgroundImageView addMotionEffect:interpolationHorizontal];
  [_backgroundImageView addMotionEffect:interpolationVertical];
}

@end
