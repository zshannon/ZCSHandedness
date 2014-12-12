ZCSHandedness
=============

Apps can be made better if you can make a prediction about which hand in holding the device.

This is basically a toy at the moment. It's functional, but highly unsophisticated. Seeking pull requests.

## Add to your Podfile

`pod 'ZCSHandedness', '~> 0.0.1'`

## Use in your project

### Setup

```obj-c
#import "ZCSHandedness.h"

// Subscribe to hand change notifications
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handednessChanged:) ZCSHandednessDidChangeNotification object:[ZCSHandedness sharedHandedness]];

```

### Target Action

```obj-c
- (void) handednessChanged:(NSNotification*) note {
	switch ([ZCSHandedness sharedHandedness].handedness) {
		case ZCSHandednessLeftHandedness:
			NSLog(@"I'm in the user's left hand!");
			break;
		case ZCSHandednessRightHandedness:
			NSLog(@"I'm in the user's right hand!");
			break;
		default:
			NSLog(@"I'm not sure which hand I'm in!");
			break;
	}
}
```

## Contributing ##

Send me Pull Requests here, please.