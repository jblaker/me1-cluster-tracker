//
//  ClusterCell.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "ClusterCell.h"
#import "Cluster.h"

@implementation ClusterCell

@synthesize cluster=_cluster;

- (void)setCluster:(Cluster *)cluster {
  _cluster = cluster;
  NSInteger allTotal = [[_cluster systems] count];
  NSInteger exploredTotal = [_cluster numberOfExploredSystems];
  [[self textLabel] setText:[NSString stringWithFormat:@"%@ (%i/%i)", [_cluster title], exploredTotal, allTotal]];
}

@end
