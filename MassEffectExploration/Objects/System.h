//
//  System.h
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 1/10/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cluster, Planet;

@interface System : NSManagedObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) Cluster *cluster;
@property (nonatomic, retain) NSSet *planets;
@end

@interface System (CoreDataGeneratedAccessors)

- (void)addPlanetsObject:(Planet *)value;
- (void)removePlanetsObject:(Planet *)value;
- (void)addPlanets:(NSSet *)values;
- (void)removePlanets:(NSSet *)values;

@end
