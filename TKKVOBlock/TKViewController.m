//
//  TKViewController.m
//  TKKVOBlock
//
//  Created by tinkl on 21/5/14.
//  Copyright (c) 2014 ___TINKL___. All rights reserved.
//

#import "TKViewController.h"
#import "NSObject+TKBlock.h"

@interface TKViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textview;

@property (readwrite, nonatomic, retain) NSString *testValue;

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self testTokens];
    [self testOneShot];
    [self testMultipleObservers];

}


- (void)testTokens
{
    NSLog(@"##### TOKENS #####");
    
    id theToken = [self addKVOBlockForKeyPath:@"testValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld handler:^(NSString *keyPath, id object, NSDictionary *change) {
        NSLog(@"I see you changed value from \"%@\" to \"%@\"", [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
    }];
    
    self.testValue = @"A horse";
    self.testValue = @"is a horse";
    self.testValue = @"of course";
    self.testValue = @"of course.";
    self.testValue = NULL;
    
    [self removeKVOBlockForToken:theToken];
}

- (void)testOneShot
{
    NSLog(@"##### ONE SHOT #####");
    
    [self addKVOBlockForKeyPath:@"testValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld handler:^(NSString *keyPath, id object, NSDictionary *change) {
        NSLog(@"I see you changed value from \"%@\" to \"%@\"", [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
    }];
    
    self.testValue = @"A horse";
    self.testValue = @"is a horse";
    self.testValue = @"of course";
    self.testValue = @"of course.";
    self.testValue = NULL;
}

- (void)testMultipleObservers
{
    NSLog(@"##### TOKENS #####");
    
    id A = [self addKVOBlockForKeyPath:@"testValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld handler:^(NSString *keyPath, id object, NSDictionary *change) {
        NSLog(@"(A) I see you changed value from \"%@\" to \"%@\"", [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
    }];
    id B = [self addKVOBlockForKeyPath:@"testValue" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld handler:^(NSString *keyPath, id object, NSDictionary *change) {
        NSLog(@"(B) I see you changed value from \"%@\" to \"%@\"", [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
    }];
    
    self.testValue = @"A horse";
    self.testValue = @"is a horse";
    self.testValue = @"of course";
    self.testValue = @"of course.";
    self.testValue = NULL;
    
    [self removeKVOBlockForToken:A];
    [self removeKVOBlockForToken:B];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
