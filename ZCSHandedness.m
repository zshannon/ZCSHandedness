//
//  ZCSHandedness.m
//  ZCSHandednessExample
//
//  Created by Zane Shannon on 12/11/14.
//  Copyright (c) 2014 Zane Shannon. All rights reserved.
//

#import "ZCSHandedness.h"

@implementation ZCSHandedness

NSString *const ZCSHandednessDidChangeNotification = @"ZCSHandednessDidChangeNotification";
NSString *const ZCSHandednessState = @"Handedness";

static ZCSHandedness *shared = nil;

@synthesize handedness = _handedness;

- (int) handedness {
	return _handedness;
}

- (void) setHandedness:(int)handedness {
	if (handedness != _handedness) {
		_handedness = handedness;
		[[NSNotificationCenter defaultCenter] postNotificationName:ZCSHandednessDidChangeNotification object:shared userInfo:@{ZCSHandednessState: [NSNumber numberWithInt:_handedness]}];
	}
}

- (ZCSHandedness *) init {
	self = [super init];
	if (! self) return nil;
	
	// TODO: start tracking device position and updating handedness
	
	return self;
}

+ (ZCSHandedness *)sharedHandedness {
	if (shared == nil) {
		shared = [[self alloc] init];
	}
	return shared;
}

@end
