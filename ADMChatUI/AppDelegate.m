//
//  AppDelegate.m
//  ADMChatUI
//
//  Created by WangKai on 2021/8/16.
//

#import "AppDelegate.h"
#import "ADMUserViewController.h"
#import "ADMSessionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UITabBarController *rootVC = [[UITabBarController alloc] init];
    rootVC.tabBar.translucent = NO;
    
    ADMSessionViewController *firstViewController = [[ADMSessionViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    ADMUserViewController *secondViewController = [[ADMUserViewController alloc] init];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    
    [rootVC setViewControllers:@[firstNav,secondNav]];
    [self setConfig:rootVC];
    
    [self.window setRootViewController:rootVC];
    
    //禁止多点触控
    [[UIView appearance] setExclusiveTouch:YES];
    
    NSLog(@"%@",NSHomeDirectory());
    
    return YES;
}

- (void)setConfig:(UITabBarController *)tabBarController {
    NSArray *titles = @[@"会话",@"好友"];
    NSArray *normalImages = @[@"chat_tabbar_session_normal",@"chat_tabbar_friend_normal"];
    NSArray *selectImages = @[@"chat_tabbar_session_selected",@"chat_tabbar_friend_selected"];
    
    for (NSInteger i = 0; i < tabBarController.viewControllers.count; i ++) {
        
        UIViewController *viewController = tabBarController.viewControllers[i];
        
        UIColor *color = [UIColor colorWithRed:34/255. green:207/255. blue:172/255. alpha:1];
        NSDictionary *atts = @{NSForegroundColorAttributeName:[UIColor darkTextColor],NSFontAttributeName:[UIFont systemFontOfSize:12]};
        NSDictionary *selAtts = @{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:12]};
        
        UIImage *img = [[UIImage imageNamed:normalImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selImg = [[UIImage imageNamed:selectImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        viewController.tabBarItem.title = titles[i];
        viewController.tabBarItem.image = img;
        viewController.tabBarItem.selectedImage = selImg;
        
        if (@available(iOS 13.0, *)) {
            UITabBarAppearance *appearance = [UITabBarAppearance new];
            appearance.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1.0];
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = atts;
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selAtts;
            viewController.tabBarItem.standardAppearance = appearance;
        }
        else {
            [viewController.tabBarItem setTitleTextAttributes:atts forState:UIControlStateNormal];
            [viewController.tabBarItem setTitleTextAttributes:selAtts forState:UIControlStateSelected];
        }
    }
}
 

@end
