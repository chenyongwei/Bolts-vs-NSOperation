//
//  LoadHtmlPackageOperation.h
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoadHtmlPackageOperationDelegate <NSObject>

-(void)loadHtmlPackageDidFinish:(id)result;

@end

@interface LoadHtmlPackageOperation : NSOperation

@property (nonatomic, weak) id <LoadHtmlPackageOperationDelegate> delegate;

@end
