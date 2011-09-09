//
//  AppController.h
//  OpenTheDamnDoor
//
//  Created by Lukas Rieder on 22.09.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject
{
	NSStatusItem *statusItem;
  NSConnection *connection;
}

- (IBAction)openDoor:(id)sender;
	
@end