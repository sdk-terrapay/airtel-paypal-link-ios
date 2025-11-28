//
//  AppDelegate.m
//  TPWallet
//
//  Created by Giri babu on 06/05/25.
//

#import "AppDelegate.h"
#import "TPUtils.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIViewController *vc = [TPUtils fetchVCWithBoardName:@"Main" identifier:@"TPDashboardViewController"];
    [TPUtils setUpAppConfigurations];
      if (vc) {
          self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
          self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController: vc];
          [self.window makeKeyAndVisible];
      }
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"terrapayConnectedRedirectNotification" object:url];
    return YES;
}
@end
