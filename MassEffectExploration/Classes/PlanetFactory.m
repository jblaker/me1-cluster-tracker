//
//  PlanetFactory.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "PlanetFactory.h"
#import "Planet.h"
#import "System.h"

@interface PlanetFactory ()

+ (void)createPlanetWithDict:(NSDictionary *)planetDict inSystem:(System *)system;

@end

@implementation PlanetFactory

+ (void)createPlanetsWithArray:(NSArray *)planets inSystem:(System *)system {
  
  [planets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [PlanetFactory createPlanetWithDict:obj inSystem:system];
  }];
  
}

+ (void)createPlanetWithDict:(NSDictionary *)planetDict inSystem:(System *)system {
  
  Planet *planet = [Planet MR_createEntity];
  [planet setTitle:[planetDict objectForKey:@"name"]];
  [planet setUrl:[planetDict objectForKey:@"infoURL"]];
  [planet setSystem:system];
    
}

@end
