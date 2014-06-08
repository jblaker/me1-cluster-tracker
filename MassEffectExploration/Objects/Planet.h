//
//  Planet.h
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 1/10/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Planet : NSManagedObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSNumber * flagged;
@property (nonatomic, retain) NSNumber * explored;
@property (nonatomic, retain) NSManagedObject *system;

@end
