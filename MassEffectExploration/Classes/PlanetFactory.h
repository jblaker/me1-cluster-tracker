//
//  PlanetFactory.h
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@class System;

@interface PlanetFactory : NSObject

+ (void)createPlanetsWithArray:(NSArray *)planets inSystem:(System *)system;

@end
