//
// Created by Yongwei on 3/5/14.
// Copyright (c) 2014 Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoadConfigOperationDelegate <NSObject>

-(void)loadConfigDidFinish:(id)result;

@end

@interface LoadConfigOperation : NSOperation

@property (nonatomic, weak) id <LoadConfigOperationDelegate> delegate;

@end