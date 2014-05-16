//
// Created by Yongwei on 3/5/14.
// Copyright (c) 2014 Mobile. All rights reserved.
//

#import "BFTask+LoadHtmlPackage.h"


@implementation BFTask (LoadHtmlPackage)

- (BFTask *)loadHtmlPackage {
    return [[BFTask taskWithDelay:3000] continueWithBlock:^id(BFTask *task) {
        return @"html package loaded";
    }];
}

@end