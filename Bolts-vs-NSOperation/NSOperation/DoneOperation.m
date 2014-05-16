//
//  DoneOperation.m
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import "DoneOperation.h"

@implementation DoneOperation



-(void)main
{
    
    @autoreleasepool {
        
        if (self.isCancelled) {
            return;
        }
        
        [NSThread sleepForTimeInterval:0];
        
        
        if (self.isCancelled) {
            return;
        }
        
        
        [(NSObject *)self.delegate performSelectorOnMainThread:@selector(doneOperationDidFinish:) withObject:@"all operations are finished" waitUntilDone:NO];
    }
}


@end
