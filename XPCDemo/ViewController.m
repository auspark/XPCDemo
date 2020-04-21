//
//  ViewController.m
//  XPCDemo
//
//  Created by Jerry.Yang on 2020/4/21.
//  Copyright © 2020 Jerry.Yang. All rights reserved.
//

#import "ViewController.h"
@interface ViewController(){
    NSXPCConnection *_connectionToService;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"com.company.XPCService"];
    _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServiceProtocol)];
    [_connectionToService resume];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)XPCTest:(id)sender {
    [[_connectionToService remoteObjectProxy] upperCaseString:@"hello" withReply:^(NSString *aString) {
        NSLog(@"Result string was: %@", aString);
    }];
}


@end
