//
//  PlanetsViewController.m
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "PlanetsViewController.h"
#import "System.h"
#import "Planet.h"

@implementation PlanetsViewController

@synthesize system=_system;

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:[_system title]];
  UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Milky_Way_Galaxy"]];
  [backgroundImage setAlpha:0.5];
  [self.tableView setBackgroundView:backgroundImage];
  [self.tableView setBackgroundColor:[UIColor colorWithRed:62.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0]];
}

#pragma mark - Table view data source

- (NSFetchedResultsController *)fetchedResultsController {
  
  if(_fetchedResultsController != nil) {
    return _fetchedResultsController;
  }
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"system == %@", _system];
  _fetchedResultsController = [Planet MR_fetchAllSortedBy:@"title" ascending:YES withPredicate:predicate groupBy:nil delegate:self];
  
  return _fetchedResultsController;
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [[[self fetchedResultsController] sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[[[self fetchedResultsController] sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"PlanetCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  Planet *planet = [_fetchedResultsController objectAtIndexPath:indexPath];
  
  NSString *clusterName = [planet title];
  
  [[cell textLabel] setText:clusterName];
  
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
