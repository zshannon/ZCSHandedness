//
//  ViewController.m
//  ZCSHandednessExample
//
//  Created by Zane Shannon on 12/11/14.
//  Copyright (c) 2014 Zane Shannon. All rights reserved.
//

#import "ViewController.h"
#import "ZCSHandedness.h"

@interface ViewController ()

- (void) handednessChanged:(NSNotification*) note;

@end

@implementation ViewController

ZCSHandedness *handedness;

- (void)viewDidLoad {
	[super viewDidLoad];
	handedness = [ZCSHandedness sharedHandedness];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handednessChanged:) name:HandednessChangeNotification object:handedness];
}

- (void) handednessChanged:(NSNotification*) note {
	switch (handedness.handedness) {
		case LeftHandedness:
			self.imageView.image = [UIImage imageNamed:@"left_hand"];
			self.label.text = @"Left Hand";
			break;
		case RightHandedness:
			self.imageView.image = [UIImage imageNamed:@"right_hand"];
			self.label.text = @"Right Hand";
			break;
		default:
			self.imageView.image = [UIImage imageNamed:@"ambig_hand"];
			self.label.text = @"Ambiguous Hand";
			break;
	}
}

@end
