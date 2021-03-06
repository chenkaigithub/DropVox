//
//  DropVoxAppDelegate.m
//  DropVox
//
//  Created by Niels Joubert on 12/26/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "DropVoxAppDelegate.h"

#import "PlayViewController.h"
#import "PlayerManager.h"
#import "MediaManager.h"
#import "DropboxSDK.h"

@implementation DropVoxAppDelegate

@synthesize window;
@synthesize playViewController;
@synthesize playerManager;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	playerManager = [[PlayerManager alloc] init];
	mediaManager = [[MediaManager alloc] init];
	
	playViewController = [[PlayViewController alloc] initWithPlayerManager:playerManager andMediaManager:mediaManager]; //dependency injection
	
	DBSession* dbSession = 
	[[[DBSession alloc]
	  initWithConsumerKey:@"emridj0ujv67z9a"
	  consumerSecret:@"mg7k5lepbcn1j59"]
	 autorelease];
    [DBSession setSharedSession:dbSession];
	
	[mediaManager buildTreeStructure];
	
	[window addSubview:playViewController.view];
    [window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
	NSLog(@"willResignActive\n");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	NSLog(@"didEnterBackground\n");

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
	NSLog(@"willEnterForeground\n");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
	NSLog(@"didBecomeActive\n");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	NSLog(@"willTerminate\n");
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
	NSLog(@"memoryWarning\n");
}


- (void)dealloc {
    [playViewController release];
    [window release];
    [super dealloc];
}


@end
