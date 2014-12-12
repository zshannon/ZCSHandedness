//
//  ZCSHandedness.h
//  ZCSHandednessExample
//
//  Created by Zane Shannon on 12/11/14.
//  Copyright (c) 2014 Zane Shannon. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZCSHandednessAmbiguousHandedness 0
#define ZCSHandednessLeftHandedness 1
#define ZCSHandednessRightHandedness 2

@interface ZCSHandedness : NSObject

extern NSString *const ZCSHandednessDidChangeNotification;
extern NSString *const ZCSHandednessState;

@property (nonatomic) int handedness;

+ (ZCSHandedness *)sharedHandedness;

@end
