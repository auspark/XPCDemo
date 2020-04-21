//
//  XPCService.h
//  XPCService
//
//  Created by Jerry.Yang on 2020/4/21.
//  Copyright © 2020 Jerry.Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPCServiceProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface XPCService : NSObject <XPCServiceProtocol>
@end
