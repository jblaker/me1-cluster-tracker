//
//  ClusterFactory.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 1/10/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "ClusterFactory.h"
#import "Cluster.h"
#import "SystemFactory.h"

@interface ClusterFactory ()

+ (void)createClusterWithDict:(NSDictionary *)clusterDict;

@end

@implementation ClusterFactory

+ (void)createClustersWithArray:(NSArray *)clusters {
  
  [clusters enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [ClusterFactory createClusterWithDict:obj];
  }];
  
  [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"dataImported"];
    [defaults synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clusterCreationComplete" object:nil];
  }];
  
}

+ (void)createClusterWithDict:(NSDictionary *)clusterDict {
  
  Cluster *cluster = [Cluster MR_createEntity];
  [cluster setTitle:[clusterDict objectForKey:@"name"]];
  [cluster setUrl:[clusterDict objectForKey:@"infoURL"]];
  
  [SystemFactory createSystemsWithArray:[clusterDict objectForKey:@"systems"] inCluster:cluster];
  
}

@end
