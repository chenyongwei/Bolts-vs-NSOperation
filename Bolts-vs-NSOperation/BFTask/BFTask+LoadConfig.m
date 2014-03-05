//
// Created by Yongwei on 3/5/14.
// Copyright (c) 2014 Mobile. All rights reserved.
//

#import "BFTask+LoadConfig.h"


@implementation BFTask (LoadConfig)

-(BFTask *)loadConfigAsync {
    return [[BFTask taskWithDelay:3000] continueWithBlock:^id(BFTask *task) {
        return @"load config success";
    }];
}

@end