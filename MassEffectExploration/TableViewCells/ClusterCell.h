//
//  ClusterCell.h
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "ShepardTableViewCell.h"

@class Cluster;

@interface ClusterCell : ShepardTableViewCell

@property (nonatomic, strong) Cluster *cluster;

@end
