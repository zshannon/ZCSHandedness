//
//  ZCSHandedness.m
//  ZCSHandednessExample
//
//  Created by Zane Shannon on 12/11/14.
//  Copyright (c) 2014 Zane Shannon. All rights reserved.
//

#import "ZCSHandedness.h"
#import <CoreMotion/CoreMotion.h>

#ifndef ZCSHandednessUpdateInterval
#define ZCSHandednessUpdateInterval 1.0
#endif

#ifndef ZCSHandednessAmbiguityQuotient
#define ZCSHandednessAmbiguityQuotient 0.05
#endif

@interface ZCSHandedness()

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (nonatomic) CMAcceleration lastAcceleration;
@property (nonatomic) CMRotationRate lastRotation;

- (void) outputAccelertionData:(CMAcceleration) acceleration;
- (void) outputRotationData:(CMRotationRate) rotation;
- (void) calculateHandedness;

@end

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
	self.motionManager = [[CMMotionManager alloc] init];
	self.motionManager.accelerometerUpdateInterval = ZCSHandednessUpdateInterval;
	self.motionManager.gyroUpdateInterval = ZCSHandednessUpdateInterval;
	[self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
											 withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
												 [self outputAccelertionData:accelerometerData.acceleration];
											 }];
	[self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
									withHandler:^(CMGyroData *gyroData, NSError *error) {
										[self outputRotationData:gyroData.rotationRate];
									}];
	return self;
}

- (void) outputAccelertionData:(CMAcceleration) acceleration {
	self.lastAcceleration = acceleration;
	//NSLog(@"acceleration: [%f, %f, %f]", acceleration.x, acceleration.y, acceleration.z);
	[self calculateHandedness];
}
- (void) outputRotationData:(CMRotationRate) rotation {
	self.lastRotation = rotation;
	// NSLog(@"rotation: [%f, %f, %f]", rotation.x, rotation.y, rotation.z);
	[self calculateHandedness];
}

- (void) calculateHandedness {
	
	// TODO: improve this algorithm lol
	
	if (ABS(self.lastAcceleration.x) < ZCSHandednessAmbiguityQuotient) {
		self.handedness = ZCSHandednessAmbiguousHandedness;
	}
	else if (self.lastAcceleration.x > 0) {
		self.handedness = ZCSHandednessRightHandedness;
	}
	else if (self.lastAcceleration.x < 0) {
		self.handedness = ZCSHandednessLeftHandedness;
	}
	else {
		// very very rvre case
		self.handedness = ZCSHandednessAmbiguousHandedness;
	}
}

+ (ZCSHandedness *)sharedHandedness {
	if (shared == nil) {
		shared = [[self alloc] init];
	}
	return shared;
}

@end
