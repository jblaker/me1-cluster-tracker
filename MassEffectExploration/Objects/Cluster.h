//
//  Cluster.h
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 1/10/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Cluster : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSSet *systems;
@end

@interface Cluster (CoreDataGeneratedAccessors)

- (void)addSystemsObject:(NSManagedObject *)value;
- (void)removeSystemsObject:(NSManagedObject *)value;
- (void)addSystems:(NSSet *)values;
- (void)removeSystems:(NSSet *)values;

- (NSInteger)numberOfExploredSystems;

@end
