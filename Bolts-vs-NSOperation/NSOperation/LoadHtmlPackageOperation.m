//
//  LoadHtmlPackageOperation.m
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import "LoadHtmlPackageOperation.h"

@implementation LoadHtmlPackageOperation


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
        
        
        [(NSObject *)self.delegate performSelectorOnMainThread:@selector(loadHtmlPackageDidFinish:) withObject:@"html package loaded" waitUntilDone:NO];
    }
}


@end
