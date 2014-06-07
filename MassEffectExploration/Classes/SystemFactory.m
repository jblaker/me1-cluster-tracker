//
//  SystemFactory.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "SystemFactory.h"
#import "System.h"
#import "PlanetFactory.h"

@interface SystemFactory ()

+ (void)createSystemWithDict:(NSDictionary *)systemDict inCluster:(Cluster *)cluster;

@end

@implementation SystemFactory

+ (void)createSystemsWithArray:(NSArray *)systems inCluster:(Cluster *)cluster {
  
  [systems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [SystemFactory createSystemWithDict:obj inCluster:cluster];
  }];
  
}


+ (void)createSystemWithDict:(NSDictionary *)systemDict inCluster:(Cluster *)cluster {
  
  System *system = [System MR_createEntity];
  [system setTitle:[systemDict objectForKey:@"name"]];
  [system setUrl:[systemDict objectForKey:@"infoURL"]];
  [system setCluster:cluster];
  
  [PlanetFactory createPlanetsWithArray:[systemDict objectForKey:@"planets"] inSystem:system];
  
}

@end
