//
//  LoadLessonContentOperation.m
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import "LoadLessonContentOperation.h"

@implementation LoadLessonContentOperation


-(void)main
{
    
    @autoreleasepool {
        
        if (self.isCancelled) {
            return;
        }
        
        [NSThread sleepForTimeInterval:5];
        
        
        if (self.isCancelled) {
            return;
        }
        
        
        [(NSObject *)self.delegate performSelectorOnMainThread:@selector(loadLessonContentDidFinish:) withObject:@"lesson content loaded" waitUntilDone:NO];
    }
}



@end
