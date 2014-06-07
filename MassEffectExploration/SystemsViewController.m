//
//  SystemsViewController.m
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "SystemsViewController.h"
#import "PlanetsViewController.h"
#import "WebViewController.h"
#import "System.h"
#import "Cluster.h"
#import "ShepardTableViewCell.h"
#import "PlanetsViewController.h"

@interface SystemsViewController () {
  System *_selectedSystem;
}

@end

@implementation SystemsViewController

@synthesize cluster=_cluster;

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:[_cluster title]];
  UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(launchWebView:)];
  [[self navigationItem] setRightBarButtonItem:infoButton];
  UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Milky_Way_Galaxy"]];
  [backgroundImage setAlpha:0.5];
  [self.tableView setBackgroundView:backgroundImage];
  [self.tableView setBackgroundColor:[UIColor colorWithRed:62.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0]];
}

- (void)launchWebView:(id)sender {
  [self performSegueWithIdentifier:@"WebView" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if([[segue identifier] isEqualToString:@"Planets"]) {
    PlanetsViewController *planetsVC = [segue destinationViewController];
    [planetsVC setSystem:_selectedSystem];
  }
  
  if([[segue identifier] isEqualToString:@"WebView"]) {
    WebViewController *webVC = [[[segue destinationViewController] viewControllers] firstObject];
    [webVC setTitle:[_cluster title]];
    [webVC setUrlToLoad:[_cluster url]];
  }
  
}

#pragma mark - Table view data source

- (NSFetchedResultsController *)fetchedResultsController {
  
  if(_fetchedResultsController != nil) {
    return _fetchedResultsController;
  }
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cluster == %@", _cluster];
  _fetchedResultsController = [System MR_fetchAllSortedBy:@"title" ascending:YES withPredicate:predicate groupBy:nil delegate:self];
  
  return _fetchedResultsController;
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [[[self fetchedResultsController] sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[[[self fetchedResultsController] sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"SystemCell";
  ShepardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[ShepardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  Cluster *cluster = [_fetchedResultsController objectAtIndexPath:indexPath];
  
  NSString *clusterName = [cluster title];
  
  [[cell textLabel] setText:clusterName];
  
  return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  _selectedSystem = [_fetchedResultsController objectAtIndexPath:indexPath];
  [self performSegueWithIdentifier:@"Planets" sender:nil];
}

@end
