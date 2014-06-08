//
//  AppDelegate.m
//  MassEffectExploration
//
//  Created by Jeremy Blaker on 2/23/13.
//  Copyright (c) 2013 Blaker Design. All rights reserved.
//

#import "AppDelegate.h"
#import "ClusterFactory.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [MagicalRecord setupCoreDataStack];
  [self setupAppearances];
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if([defaults boolForKey:@"dataImported"] == NO) {
    [self prepareData];
  }
  return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
  [MagicalRecord cleanUp];
}

- (void)setupAppearances {
  NSDictionary *textAtts = [NSDictionary dictionaryWithObjects:@[[UIFont fontWithName:@"Mass Effect Game 123" size:15], [UIColor colorWithRed:174.0f/255.0f green:8.0f/255.0f blue:17.0f/255.0f alpha:1.0f]] forKeys:@[NSFontAttributeName, NSForegroundColorAttributeName]];
  [[UINavigationBar appearance] setTitleTextAttributes:textAtts];
  [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
  
  textAtts = [NSDictionary dictionaryWithObjects:@[[UIFont fontWithName:@"Mass Effect Game 123" size:11]] forKeys:@[NSFontAttributeName]];
  [[UIBarButtonItem appearance] setTitleTextAttributes:textAtts forState:UIControlStateNormal];
}

- (void)prepareData {
  
  NSURL *file = [[NSBundle mainBundle] URLForResource:@"clusters" withExtension:@"plist"];
  
  NSDictionary *plistContents = [[NSDictionary alloc] initWithContentsOfURL:file];
  
  NSArray *clusters = [plistContents objectForKey:@"clusters"];
  
  [ClusterFactory createClustersWithArray:clusters];
  
//  for ( NSDictionary *cluster in clusters ) {
//    NSLog(@"Added cluster %@", [cluster objectForKey:@"name"]);
//    NSArray *systems = [cluster objectForKey:@"systems"];
//    for (NSDictionary *system in systems) {
//      NSArray *planets = [system objectForKey:@"planets"];
//      for (NSString *planet in planets) {
//        NSLog(@"Planet %@ in system %@ in cluster %@", planet, [system objectForKey:@"name"], [cluster objectForKey:@"name"]);
//      }
//    }
//  }

    
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory {
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
