//
// Created by Yongwei on 3/5/14.
// Copyright (c) 2014 Mobile. All rights reserved.
//

#import "BFTask+Login.h"
#import "BFTaskCompletionSource.h"


@implementation BFTask (Login)

- (BFTask *)loginAsync {
    // simulate login takes 2 seconds
    return [[BFTask taskWithDelay:2000] continueWithBlock:^id(BFTask *task) {
        return @"login success";
    }];
}

@end