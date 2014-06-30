//
//  AppDelegate.m
//  kakaoLogin-iOS
//
//  Created by kimkkikki on 2014. 5. 27..
//  Copyright (c) 2014년 baas.io. All rights reserved.
//

#import "AppDelegate.h"

#define BAAS_IO_ID @"53fb18c8-ce7f-11e3-ba5f-02005ab8001c"
#define BAAS_IO_APPLICATION_ID @"ae2a77d0-ce9e-11e3-ba5f-02005ab8001c"
#define BAAS_IO_API_URL @"https://stgapi.baas.io"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Baasio setApplicationInfo:BAAS_IO_API_URL baasioID:BAAS_IO_ID applicationName:BAAS_IO_APPLICATION_ID];
    
//    [Baasio setApplicationInfo:BAAS_IO_ID applicationName:BAAS_IO_APPLICATION_ID];
    [[Baasio sharedInstance] isDebugMode:YES];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if( [KOSession isKakaoAccountLoginCallback:url] ) {
        return [KOSession handleOpenURL:url];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [KOSession handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
