//
//  NSObject+TKBlock.h
//  TKKVOBlock
//
//  Created by tinkl on 21/5/14.
//  Copyright (c) 2014 ___TINKL___. All rights reserved.
//

#import <Foundation/Foundation.h>
//@import Foundation;

typedef void (^KVOFullBlock)(NSString *keyPath, id object, NSDictionary *change);

@interface NSObject (TKBlock)

- (id)addKVOBlockForKeyPath:(NSString *)inKeyPath options:(NSKeyValueObservingOptions)inOptions handler:(KVOFullBlock)inHandler;
- (void)removeKVOBlockForToken:(id)inToken;

@end
