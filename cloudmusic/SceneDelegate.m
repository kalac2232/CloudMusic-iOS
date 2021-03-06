//
//  SceneDelegate.m
//  cloudmusic
//
//  Created by 郭皓楠 on 2020/5/30.
//  Copyright © 2020 郭皓楠. All rights reserved.
//

#import "SceneDelegate.h"
#import "MainViewController.h"
#import "UIColor+Hex.h"
#import "DiscoveryMainController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

    UIWindowScene * windowScene = (UIWindowScene *)scene;
    _window = [[UIWindow alloc] initWithFrame:windowScene.coordinateSpace.bounds];
    _window.windowScene = windowScene;
    
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    navigationController.navigationBar.hidden = YES;
    
    
    UIViewController *controller1 = [[DiscoveryMainController alloc] init];
    
    //controller1.view.backgroundColor = [UIColor redColor];
    controller1.tabBarItem.title = @"发现";
    controller1.tabBarItem.image = [UIImage imageNamed:@"btm_icn_discovery"];
    //controller1.tabBarItem.selectedImage = [[UIImage imageNamed:@"btm_icn_discovery_prs"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    controller1.tabBarItem.selectedImage = [self composeImg:@"btm_icn_discovery_prs"];
    
    
    
    UIViewController *controller2 = [[UIViewController alloc] init];
    controller2.view.backgroundColor = [UIColor blueColor];
    controller2.tabBarItem.title = @"视频";
    controller2.tabBarItem.image = [UIImage imageNamed:@"btm_icn_video"];
    controller2.tabBarItem.selectedImage = [self composeImg:@"btm_icn_video_prs"];
    
    UIViewController *controller3 = [[UIViewController alloc] init];
    controller3.view.backgroundColor = [UIColor yellowColor];
    controller3.tabBarItem.title = @"我的";
    controller3.tabBarItem.image = [UIImage imageNamed:@"btm_icn_music"];
    controller3.tabBarItem.selectedImage = [self composeImg:@"btm_icn_music_prs"];
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor yellowColor];
    controller4.tabBarItem.title = @"云村";
    controller4.tabBarItem.image = [UIImage imageNamed:@"btm_icn_friend"];
    controller4.tabBarItem.selectedImage = [self composeImg:@"btm_icn_friend_prs"];
    
    UIViewController *controller5 = [[UIViewController alloc] init];
    controller5.view.backgroundColor = [UIColor yellowColor];
    controller5.tabBarItem.title = @"账号";
    controller5.tabBarItem.image = [UIImage imageNamed:@"btm_icn_account"];
    controller5.tabBarItem.selectedImage = [self composeImg:@"btm_icn_account_prs"];
    
    [tabbarController setViewControllers:@[controller1,controller2,controller3,controller4,controller5]];
    
    
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = [UITabBarAppearance new];
        // 设置未被选中的颜色
        //appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        // 设置被选中时的颜色
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#FF3A3A"]};
        
        controller1.tabBarItem.standardAppearance = appearance;
        controller2.tabBarItem.standardAppearance = appearance;
        controller3.tabBarItem.standardAppearance = appearance;
        controller4.tabBarItem.standardAppearance = appearance;
        controller5.tabBarItem.standardAppearance = appearance;
    } else {
        [controller1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    }
    
    
    [_window setRootViewController:navigationController];
    [_window makeKeyAndVisible];
    
}

- (UIImage *)composeImg:(NSString *)imageSrc {
    UIImage *img = [[UIImage imageNamed:@"badge_outside_color"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    //以1.png的图大小为底图
    UIImage *img1 = [[UIImage imageNamed:imageSrc] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    CGSize bgSize = CGSizeMake(28, 28);
    
    //设置0.0防止新图模糊
    UIGraphicsBeginImageContextWithOptions(bgSize,NO,0.0);
    [img drawInRect:CGRectMake(0, 0, bgSize.width, bgSize.height)];

    [img1 drawInRect:CGRectMake((bgSize.width - img1.size.width)/2,(bgSize.height - img1.size.height)/2, img1.size.width, img1.size.height)];
    
    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();//从当前上下文中获得最终图片
    UIGraphicsEndImageContext();//关闭上下文


    
    return [resultImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
}



- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
