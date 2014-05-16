//
//  LoginOperation.h
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginOperationDelegate <NSObject>

-(void)loginDidFinish:(id)result;

@end

@interface LoginOperation : NSOperation

@property (nonatomic, weak) id <LoginOperationDelegate> delegate;

@end

