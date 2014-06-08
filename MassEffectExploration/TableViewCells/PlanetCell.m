//
//  PlanetCell.m
//  ClusterBuddy
//
//  Created by Jeremy Blaker on 6/7/14.
//  Copyright (c) 2014 Blaker Design. All rights reserved.
//

#import "PlanetCell.h"
#import "Planet.h"

@implementation PlanetCell

- (void)prepareForReuse {
  [super prepareForReuse];
  [self setAccessoryType:UITableViewCellAccessoryNone];
}

- (void)setPlanet:(Planet *)planet {
  _planet = planet;
  [[self textLabel] setText:planet.title];
  if(_planet.explored.boolValue) {
    [self setAccessoryType:UITableViewCellAccessoryCheckmark];
  } else {
    [self setAccessoryType:UITableViewCellAccessoryNone];
  }
}

@end
