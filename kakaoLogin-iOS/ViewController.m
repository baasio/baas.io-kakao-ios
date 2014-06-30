//
//  ViewController.m
//  kakaoLogin-iOS
//
//  Created by kimkkikki on 2014. 5. 27..
//  Copyright (c) 2014년 baas.io. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int xMargin = 30;
    int marginBottom = 25;
    int btnWidth = self.view.frame.size.width - xMargin*2;
    int btnHeight = 42;
    
    UIButton* kakaoLoginButton = [[KOLoginButton alloc] initWithFrame:CGRectMake(xMargin, self.view.frame.size.height-btnHeight-marginBottom, btnWidth, btnHeight)];
    [kakaoLoginButton addTarget:self action:@selector(invokeLoginWithTarget:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:kakaoLoginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)invokeLoginWithTarget:(id)sender {
    [[KOSession sharedSession] openWithCompletionHandler:^(NSError *error) {
        if ([[KOSession sharedSession] isOpen]) {
            NSLog(@"kakao login succeeded.");
            [BaasioUser signUpViaKakaotalkInBackground:[KOSession sharedSession].accessToken successBlock:^{
                NSLog(@"baas sign up succeeded.");
            } failureBlock:^(NSError *error) {
                NSLog(@"baas sign up failed.");
            }];
        } else {
            NSLog(@"kakao login failed.");
        }
    }];
}

@end
