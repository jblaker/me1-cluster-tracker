//
//  SystemsViewController.h
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "BaseTableViewController.h"

@class Cluster;

@interface SystemsViewController : BaseTableViewController

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) Cluster *cluster;

@end
