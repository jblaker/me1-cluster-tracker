//
//  PlanetCell.h
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "ShepardTableViewCell.h"

@class Planet;

@interface PlanetCell : ShepardTableViewCell

@property (nonatomic, strong) Planet *planet;

@end
