//
//  SystemsViewController.m
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "SystemsViewController.h"
#import "PlanetsViewController.h"

@implementation SystemsViewController

@synthesize systems=_systems;

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
