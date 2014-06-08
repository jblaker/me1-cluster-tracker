//
//  System.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 1/10/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "System.h"
#import "Cluster.h"
#import "Planet.h"


@implementation System

@dynamic title;
@dynamic url;
@dynamic cluster;
@dynamic planets;

- (NSInteger)numberOfExploredPlanets {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"system == %@ AND explored == 1", self];
  NSArray *totalPlanets = [Planet MR_findAllWithPredicate:predicate];
  return [totalPlanets count];
}

- (BOOL)fullyExplored {
  return self.numberOfExploredPlanets == self.planets.count;
}

@end
