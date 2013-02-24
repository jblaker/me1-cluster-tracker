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

@implementation SystemsViewController

@synthesize systemDictionary=_systemDictionary;

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setTitle:[_systemDictionary objectForKey:@"name"]];
  
  _systems = [_systemDictionary objectForKey:@"systems"];
  
  UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(launchWebView:)];
  
  [[self navigationItem] setRightBarButtonItem:infoButton];
  
}

- (void)launchWebView:(id)sender {
  WebViewController *webVC = [[WebViewController alloc] init];
  [webVC setUrlToLoad:[_systemDictionary objectForKey:@"infoURL"]];
  [webVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
  [self presentViewController:webVC animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_systems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
    
  NSString *clusterName = [[_systems objectAtIndex:indexPath.row] objectForKey:@"name"];
  
  [[cell textLabel] setText:clusterName];
  
  return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  PlanetsViewController *planetsVC = [[PlanetsViewController alloc] init];
  [planetsVC setPlanets:[[_systems objectAtIndex:indexPath.row] objectForKey:@"planets"]];
  [[self navigationController] pushViewController:planetsVC animated:YES];
}

@end
