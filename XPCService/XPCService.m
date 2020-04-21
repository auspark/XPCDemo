//
//  XPCService.m
//  XPCService
//
//  Created by Jerry.Yang on 2020/4/21.
//  Copyright © 2020 Jerry.Yang. All rights reserved.
//

#import "XPCService.h"

@implementation XPCService

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
