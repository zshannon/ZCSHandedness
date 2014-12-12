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

- (void)viewDidLoad {
	[super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handednessChanged:) name:ZCSHandednessDidChangeNotification object:[ZCSHandedness sharedHandedness]];
}

- (void) handednessChanged:(NSNotification*) note {
	switch ([ZCSHandedness sharedHandedness].handedness) {
		case ZCSHandednessLeftHandedness:
			self.imageView.image = [UIImage imageNamed:@"left_hand"];
			self.label.text = @"Left Hand";
			break;
		case ZCSHandednessRightHandedness:
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
