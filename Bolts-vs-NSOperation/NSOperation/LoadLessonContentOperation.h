//
//  LoadLessonContentOperation.h
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol LoadLessonContentOperationDelegate <NSObject>

-(void)loadLessonContentDidFinish:(id)result;

@end
@interface LoadLessonContentOperation : NSOperation

@property (nonatomic, weak) id <LoadLessonContentOperationDelegate> delegate;

@end
