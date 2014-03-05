//
//  DoneOperation.h
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DoneOperationDelegate <NSObject>

-(void)doneOperationDidFinish:(id)result;

@end

@interface DoneOperation : NSOperation

@property (nonatomic, weak) id <DoneOperationDelegate> delegate;

@end
