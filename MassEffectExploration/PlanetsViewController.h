//
//  PlanetsViewController.h
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@class System;

@interface PlanetsViewController : UITableViewController<NSFetchedResultsControllerDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) System *system;

@end
