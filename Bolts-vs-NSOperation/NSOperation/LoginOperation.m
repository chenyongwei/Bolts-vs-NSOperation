//
//  LoginOperation.m
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import "LoginOperation.h"

@implementation LoginOperation

-(void)main
{

    @autoreleasepool {
        
        if (self.isCancelled) {
            return;
        }
        
        [NSThread sleepForTimeInterval:2];
        
        
        if (self.isCancelled) {
            return;
        }


        [(NSObject *) self.delegate performSelectorOnMainThread:@selector(loginDidFinish:) withObject:@"login success" waitUntilDone:NO];
    }
}

@end
