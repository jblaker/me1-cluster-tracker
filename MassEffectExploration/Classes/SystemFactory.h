//
//  SystemFactory.h
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Cluster;

@interface SystemFactory : NSObject

+ (void)createSystemsWithArray:(NSArray *)systems inCluster:(Cluster *)cluster;

@end
