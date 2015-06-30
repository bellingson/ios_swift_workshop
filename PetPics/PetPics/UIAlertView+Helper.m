//
//  UIAlertView+Helper.m
//  NoFluff
//
//  Created by Benjamin Ellingson on 3/12/12.
//  Copyright (c) 2012 Northstar New Media. All rights reserved.
//

#import "UIAlertView+Helper.h"

@implementation UIAlertView (Helper)

+ (void) showAlert: (NSString *) title message: (NSString *) message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title message: message delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
    [alert show];
    
}

@end
