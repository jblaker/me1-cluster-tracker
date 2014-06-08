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
  NSDictionary *navControllerTitleFont = [NSDictionary dictionaryWithObjects:@[[UIFont fontWithName:@"Mass Effect Game 123" size:20]] forKeys:@[NSFontAttributeName]];
  [[UINavigationBar appearance] setTitleTextAttributes:navControllerTitleFont];
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
