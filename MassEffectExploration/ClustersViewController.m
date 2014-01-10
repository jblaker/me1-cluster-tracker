//
//  ClustersViewController.m
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "ClustersViewController.h"
#import "SystemsViewController.h"

@implementation ClustersViewController

@synthesize clusters=_clusters;

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:@"Clusters"];
  UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Milky_Way_Galaxy"]];
  [backgroundImage setAlpha:0.5];
  [self.tableView setBackgroundView:backgroundImage];
  [self.tableView setBackgroundColor:[UIColor colorWithRed:62.0/255.0 green:70.0/255.0 blue:86.0/255.0 alpha:1.0]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_clusters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  NSString *clusterName = [[_clusters objectAtIndex:indexPath.row] objectForKey:@"name"];
  
  [[cell textLabel] setText:clusterName];
  [[cell textLabel] setTextColor:[UIColor whiteColor]];
  
  [[cell textLabel] setFont:[UIFont fontWithName:@"Mass Effect Game 123" size:12]];
  
  [cell setBackgroundColor:[UIColor clearColor]];
  
  return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  SystemsViewController *systemsVC = [[SystemsViewController alloc] init];
  [systemsVC setSystemDictionary:[_clusters objectAtIndex:indexPath.row]];
  [[self navigationController ] pushViewController:systemsVC animated:YES];
}

@end
