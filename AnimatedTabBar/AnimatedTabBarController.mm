//
//  AnimatedTabBarController.mm
//  AnimatedTabBar
//
//  Created by Jinwoo Kim on 11/17/23.
//

#import "AnimatedTabBarController.hpp"
#import <objc/message.h>
#import <objc/runtime.h>
#import <ranges>

void *AnimatedTabBarControllerAssociationKey = &AnimatedTabBarControllerAssociationKey;

@implementation AnimatedTabBarController

- (void)_tabBarItemClicked:(UITabBarItem *)tabBarItem {
    struct objc_super superInfo = { self, [self superclass] };
    ((void (*)(struct objc_super *, SEL, id))objc_msgSendSuper)(&superInfo, _cmd, tabBarItem);
    
    NSSymbolEffect * _Nullable effect = objc_getAssociatedObject(tabBarItem, AnimatedTabBarControllerAssociationKey);
    if (!effect) return;
    
    // UITabBarButton
    __kindof UIControl *view = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(tabBarItem, NSSelectorFromString(@"view"));
    
    unsigned int ivarsCount;
    Ivar *ivars = class_copyIvarList(view.class, &ivarsCount);
    
    auto ivar = std::ranges::find_if(ivars, ivars + ivarsCount, [](Ivar ivar) {
        auto name = ivar_getName(ivar);
        return !std::strcmp(name, "_imageView");
    });
    
    uintptr_t base = reinterpret_cast<uintptr_t>(view);
    ptrdiff_t offset = ivar_getOffset(*ivar);
    delete ivars;
    
    auto location = reinterpret_cast<void *>(base + offset);
    // UITabBarSwappableImageView
    __kindof UIImageView *imageView = *static_cast<id *>(location);
    
    [imageView addSymbolEffect:effect];
}

@end
