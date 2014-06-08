//
//  ClustersViewController.m
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "ClustersViewController.h"
#import "Cluster.h"
#import "SystemsViewController.h"
#import "ClusterCell.h"

@interface ClustersViewController () {
  Cluster *_selectedCluster;
}

@end

@implementation ClustersViewController

@synthesize fetchedResultsController=_fetchedResultsController;

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:@"Clusters"];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [[self tableView] reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([[segue identifier] isEqualToString:@"Systems"]) {
    
    SystemsViewController *systemsVC = [segue destinationViewController];
    [systemsVC setCluster:_selectedCluster];
    
  }
}

#pragma mark - Helper Methods

- (void)clustersWereCreated:(NSNotification *)notification {
  _fetchedResultsController = nil;
  [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSFetchedResultsController *)fetchedResultsController {
  
  if(_fetchedResultsController != nil) {
    return _fetchedResultsController;
  }
  
  _fetchedResultsController = [Cluster MR_fetchAllSortedBy:@"title" ascending:YES withPredicate:nil groupBy:nil delegate:self];
  
  return _fetchedResultsController;
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"ClusterCell";
  ClusterCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  Cluster *cluster = [_fetchedResultsController objectAtIndexPath:indexPath];
  
  [cell setCluster:cluster];
  
  return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  _selectedCluster = [_fetchedResultsController objectAtIndexPath:indexPath];
  [self performSegueWithIdentifier:@"Systems" sender:nil];
}

@end
