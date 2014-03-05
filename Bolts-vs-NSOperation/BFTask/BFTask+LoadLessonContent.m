//
// Created by Yongwei on 3/5/14.
// Copyright (c) 2014 Mobile. All rights reserved.
//

#import "BFTask+LoadLessonContent.h"


@implementation BFTask (LoadLessonContent)

- (BFTask *)loadLessonContent {
    return [[BFTask taskWithDelay:5000] continueWithBlock:^id(BFTask *task) {
        return @"lesson content loaded";
    }];
}

@end