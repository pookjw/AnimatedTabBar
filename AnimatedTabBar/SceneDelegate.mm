//
//  SceneDelegate.mm
//  AnimatedTabBar
//
//  Created by Jinwoo Kim on 11/17/23.
//

#import "SceneDelegate.hpp"
#import "AnimatedTabBarController.hpp"
#import <objc/runtime.h>

@interface SceneDelegate ()
@end

@implementation SceneDelegate

- (void)dealloc {
    [_window release];
    [super dealloc];
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindow *window = [[UIWindow alloc] initWithWindowScene:static_cast<UIWindowScene *>(scene)];
    
    AnimatedTabBarController *tabBarController = [AnimatedTabBarController new];
    UIViewController *greenViewController = [UIViewController new];
    UIViewController *purpleViewController = [UIViewController new];
    UIViewController *grayViewController = [UIViewController new];
    
    greenViewController.view.backgroundColor = UIColor.systemGreenColor;
    greenViewController.tabBarItem.title = @"Green";
    greenViewController.tabBarItem.image = [UIImage systemImageNamed:@"lasso.badge.sparkles"];
    objc_setAssociatedObject(greenViewController.tabBarItem,
                             AnimatedTabBarControllerAssociationKey,
                             [[NSSymbolBounceEffect bounceUpEffect] effectWithByLayer],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    purpleViewController.view.backgroundColor = UIColor.systemPurpleColor;
    purpleViewController.tabBarItem.title = @"Purple";
    purpleViewController.tabBarItem.image = [UIImage systemImageNamed:@"externaldrive.badge.plus"];
    objc_setAssociatedObject(purpleViewController.tabBarItem,
                             AnimatedTabBarControllerAssociationKey,
                             [[NSSymbolBounceEffect bounceDownEffect] effectWithByLayer],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    grayViewController.view.backgroundColor = UIColor.systemGrayColor;
    grayViewController.tabBarItem.title = @"Gray";
    grayViewController.tabBarItem.image = [UIImage systemImageNamed:@"doc.richtext.fill"];
    objc_setAssociatedObject(grayViewController.tabBarItem,
                             AnimatedTabBarControllerAssociationKey,
                             [[NSSymbolBounceEffect bounceUpEffect] effectWithByLayer],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [tabBarController setViewControllers:@[greenViewController, purpleViewController, grayViewController] animated:NO];
    [greenViewController release];
    [purpleViewController release];
    [grayViewController release];
    
    window.rootViewController = tabBarController;
    [tabBarController release];
    [window makeKeyAndVisible];
    self.window = window;
    [window release];
}

@end
