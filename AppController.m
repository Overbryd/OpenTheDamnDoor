//
//  AppController.m
//  OpenTheDamnDoor
//
//  Created by Lukas Rieder on 22.09.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (void) awakeFromNib{
	
	//Create the NSStatusBar and set its length
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength] retain];
	
	//Setup the statusItem
	[statusItem setTitle:[NSString stringWithFormat:@"%C", 0x2a4e]];
	[statusItem setToolTip:@"Someone open the damn door already!!!"];
	[statusItem setAction:@selector(openDoor:)];
	[statusItem setTarget:self];
	[statusItem setHighlightMode:YES];
}

//- (void) dealloc {
//	[super dealloc];
//}

-(IBAction)openDoor:(id)sender{
	NSLog(@"Trying to open the Door");
	
	// Setup a request
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://door/letmein"] 
														   cachePolicy:NSURLRequestReloadIgnoringLocalCacheData 
													   timeoutInterval:5.0];
	[request setHTTPMethod:@"GET"];
	
	// Open the connection¬¬
    [[NSURLConnection alloc] initWithRequest:request delegate:self]; 
}

// Everything is fine
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[connection release];
	NSLog(@"Door opened.");
}

// Something went wrong
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [connection release];
	
	NSLog(@"Doorduino failed!");
    //NSLog(@"Connection Error - %@ %@",
    //      [error localizedDescription]);
	
	NSBeginAlertSheet(@"Connection to Doorduino failed.", @"OK, I'll run and open the door.", nil, nil, nil, self, nil, nil, nil, @"");
}

@end
