//
//  PlanetsViewController.h
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "BaseTableViewController.h"

@class System;

@interface PlanetsViewController : BaseTableViewController<UIActionSheetDelegate>

@property (nonatomic, strong) System *system;

@end
