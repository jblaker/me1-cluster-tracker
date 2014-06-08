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
#import "WebViewController.h"
#import "PlanetCell.h"

@interface PlanetsViewController () {
  Planet *_selectedPlanet;
}

@end

@implementation PlanetsViewController

@synthesize system=_system;

- (void)viewDidLoad {
  [super viewDidLoad];
  UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(launchWebView:)];
  [[self navigationItem] setRightBarButtonItem:infoButton];
  [self setTitle:[_system title]];
  UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Milky_Way_Galaxy"]];
  [backgroundImage setAlpha:0.5];
  [self.tableView setBackgroundView:backgroundImage];
  [self.tableView setBackgroundColor:[UIColor colorWithRed:62.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0]];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  _selectedPlanet = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if([[segue identifier] isEqualToString:@"WebView"]) {
    WebViewController *webVC = [[[segue destinationViewController] viewControllers] firstObject];
    if(_selectedPlanet) {
      [webVC setTitle:[_selectedPlanet title]];
      [webVC setUrlToLoad:[_selectedPlanet url]];
    } else {
      [webVC setTitle:[_system title]];
      [webVC setUrlToLoad:[_system url]];
    }
  }
  
}

- (void)launchWebView:(id)sender {
  [self performSegueWithIdentifier:@"WebView" sender:nil];
}

- (void)toggleExplorationStatusForPlanet:(Planet *)planet {
  [planet setExplored:[NSNumber numberWithBool:!planet.explored.boolValue]];
  [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
    [[self tableView] reloadData];
  }];
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
  PlanetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  Planet *planet = [_fetchedResultsController objectAtIndexPath:indexPath];
  
  [cell setPlanet:planet];
  
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
  _selectedPlanet = [_fetchedResultsController objectAtIndexPath:indexPath];
  UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:_selectedPlanet.title delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Info", @"Toggle explored", nil];
  [actionSheet showInView:self.view];
}

#pragma mark - Action Sheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  
  switch(buttonIndex){
    case 0:
      [self performSegueWithIdentifier:@"WebView" sender:nil];
      break;
    case 1:
      [self toggleExplorationStatusForPlanet:_selectedPlanet];
      break;
  }
  
}

@end
