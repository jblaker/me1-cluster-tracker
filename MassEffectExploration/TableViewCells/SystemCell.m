//
//  SystemCell.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "SystemCell.h"
#import "System.h"

@implementation SystemCell

@synthesize system=_system;

- (void)setSystem:(System *)system {
  _system = system;
  NSInteger allTotal = [[_system planets] count];
  NSInteger exploredTotal = [_system numberOfExploredPlanets];
  [[self textLabel] setText:[NSString stringWithFormat:@"%@ (%i/%i)", [_system title], exploredTotal, allTotal]];
}

@end
