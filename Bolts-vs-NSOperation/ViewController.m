//
//  ViewController.m
//  Bolts-vs-NSOperation
//
//  Created by Yongwei on 3/5/14.
//  Copyright (c) 2014 Mobile. All rights reserved.
//

#import "ViewController.h"
#import "BFTask+Login.h"
#import "BFTask+LoadConfig.h"
#import "BFTask+LoadHtmlPackage.h"
#import "BFTask+LoadLessonContent.h"
#import "BFExecutor.h"
#import "LoginOperation.h"
#import "LoadConfigOperation.h"
#import "LoadHtmlPackageOperation.h"
#import "LoadLessonContentOperation.h"
#import "DoneOperation.h"

@interface ViewController () <LoginOperationDelegate, LoadConfigOperationDelegate, LoadHtmlPackageOperationDelegate, LoadLessonContentOperationDelegate, DoneOperationDelegate>

@property (nonatomic, strong) IBOutlet UILabel *boltsProgressLabel;
@property (nonatomic, strong) IBOutlet UIButton *boltsStartButton;
-(IBAction)boltsStartButtonClicked;

@property (nonatomic, strong) IBOutlet UILabel *nsProgressLabel;
@property (nonatomic, strong) IBOutlet UIButton *nsStartButton;
-(IBAction)nsStartButtonClicked;

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation ViewController

#pragma mark - The code for Bolts

- (IBAction)boltsStartButtonClicked {
    
    __weak UILabel *weakProgressLabel = self.boltsProgressLabel;
    __weak UIButton *weakStartTasksBtn = self.boltsStartButton;

    weakProgressLabel.text = @"starting ...";
    [weakStartTasksBtn setUserInteractionEnabled:NO];
    [weakStartTasksBtn setTitle:@"Processing" forState:UIControlStateNormal];

    BFTask *taskInstance= [[BFTask alloc] init];
    
    [[[[[taskInstance loginAsync] continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {

        weakProgressLabel.text = task.result;
        return [taskInstance loadConfigAsync];

    }] continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {

        weakProgressLabel.text = task.result;
        return nil;

    }] continueWithBlock:^id(BFTask *task) {

        NSMutableArray *tasks = [NSMutableArray array];
        [tasks addObject:[taskInstance loadHtmlPackage]];
        [tasks addObject:[taskInstance loadLessonContent]];
        return [BFTask taskForCompletionOfAllTasks:tasks];

    }] continueWithExecutor:[BFExecutor mainThreadExecutor] withBlock:^id(BFTask *task) {

        // If previous task completion with multiple tasks, "task.result" is always nil at here.
        weakProgressLabel.text = @"load html package and lesson content DONE!";
        [weakStartTasksBtn setUserInteractionEnabled:YES];
        [weakStartTasksBtn setTitle:@"Start Again" forState:UIControlStateNormal];
        return nil;

    }];

}

#pragma mark - The code for NSOperation & NSOperationQueue

- (IBAction)nsStartButtonClicked {

    self.nsProgressLabel.text = @"starting ...";
    [self.nsStartButton setUserInteractionEnabled:NO];
    [self.nsStartButton setTitle:@"Processing" forState:UIControlStateNormal];

    LoginOperation *loginOperation = [[LoginOperation alloc] init];
    loginOperation.delegate = self;
    
    LoadConfigOperation *loadConfigOperation = [[LoadConfigOperation alloc] init];
    [loadConfigOperation addDependency:loginOperation];
    loadConfigOperation.delegate = self;

    LoadHtmlPackageOperation *loadHtmlPackageOperation = [[LoadHtmlPackageOperation alloc] init];
    [loadHtmlPackageOperation addDependency:loadConfigOperation];
    [loadHtmlPackageOperation addDependency:loginOperation];
    loadHtmlPackageOperation.delegate = self;

    LoadLessonContentOperation *loadLessonContentOperation = [[LoadLessonContentOperation alloc] init];
    [loadLessonContentOperation addDependency:loadConfigOperation];
    [loadLessonContentOperation addDependency:loginOperation];
    loadLessonContentOperation.delegate = self;
    
    DoneOperation *doneOperation = [[DoneOperation alloc] init];
    [doneOperation addDependency:loginOperation];
    [doneOperation addDependency:loadConfigOperation];
    [doneOperation addDependency:loadLessonContentOperation];
    [doneOperation addDependency:loadHtmlPackageOperation];
    doneOperation.delegate = self;
    
    [self.operationQueue addOperation:loginOperation];
    [self.operationQueue addOperation:loadConfigOperation];
    [self.operationQueue addOperation:loadHtmlPackageOperation];
    [self.operationQueue addOperation:loadLessonContentOperation];
    [self.operationQueue addOperation:doneOperation];
    
}

- (void)loginDidFinish:(id)result {
    self.nsProgressLabel.text = result;
}

- (void)loadConfigDidFinish:(id)result {
    self.nsProgressLabel.text = result;
}

-(void)loadHtmlPackageDidFinish:(id)result {
    self.nsProgressLabel.text = result;
}

-(void)loadLessonContentDidFinish:(id)result {
    self.nsProgressLabel.text = result;
}

-(void)doneOperationDidFinish:(id)result {
    self.nsProgressLabel.text = result;
    [self.nsStartButton setUserInteractionEnabled:YES];
    [self.nsStartButton setTitle:@"Start Again" forState:UIControlStateNormal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.operationQueue = ({
        NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
        operationQueue.name = @"Executing Queue";
        operationQueue.maxConcurrentOperationCount = 2;
        operationQueue;
    });

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
