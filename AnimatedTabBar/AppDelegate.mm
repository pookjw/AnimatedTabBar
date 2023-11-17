//
//  AppDelegate.mm
//  AnimatedTabBar
//
//  Created by Jinwoo Kim on 11/17/23.
//

#import "AppDelegate.hpp"
#import "SceneDelegate.hpp"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    auto configiration = connectingSceneSession.configuration;
    configiration.delegateClass = SceneDelegate.class;
    return configiration;
}

@end
