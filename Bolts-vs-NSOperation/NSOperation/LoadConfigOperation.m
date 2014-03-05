//
// Created by Yongwei on 3/5/14.
// Copyright (c) 2014 Mobile. All rights reserved.
//

#import "LoadConfigOperation.h"


@implementation LoadConfigOperation {

}

-(void)main
{
    
    @autoreleasepool {
        
        if (self.isCancelled) {
            return;
        }
        
        [NSThread sleepForTimeInterval:3];
        
        
        if (self.isCancelled) {
            return;
        }
        
        
        [(NSObject *)self.delegate performSelectorOnMainThread:@selector(loadConfigDidFinish:) withObject:@"load config success" waitUntilDone:NO];
    }
}

@end