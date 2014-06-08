//
//  Cluster.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 1/10/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "Cluster.h"
#import "System.h"

@implementation Cluster

@dynamic title;
@dynamic url;
@dynamic systems;

- (NSInteger)numberOfExploredSystems {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cluster == %@", self];
  NSArray *totalSystems = [System MR_findAllWithPredicate:predicate];
  __block NSUInteger fullyExploredCount = 0;
  [totalSystems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    System *system = obj;
    if(system.fullyExplored) {
      fullyExploredCount++;
    }
  }];
  return fullyExploredCount;
}

@end
