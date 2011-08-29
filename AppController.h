//
//  AppController.h
//  OpenTheDamnDoor
//
//  Created by Lukas Rieder on 22.09.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
	/* Our outlets which allow us to access the interface */
	IBOutlet NSMenu *statusMenu;
	NSStatusItem *statusItem;
}

-(IBAction)openDoor:(id)sender;
	
@end