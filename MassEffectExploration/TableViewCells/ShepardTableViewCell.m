//
//  ShepardTableViewCell.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "ShepardTableViewCell.h"

@implementation ShepardTableViewCell

- (void)awakeFromNib {
  [[self textLabel] setTextColor:[UIColor whiteColor]];
  [[self textLabel] setFont:[UIFont fontWithName:@"Mass Effect Game 123" size:12]];
  [self setBackgroundColor:[UIColor clearColor]];
}

@end
