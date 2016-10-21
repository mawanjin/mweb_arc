//
//  RpcAccount.m
//  mweb_arc
//
//  Created by lala on 16/9/23.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import "RpcAccount.h"
#import "HttpClient.h"

@implementation RpcAccount


- (void)getAccountInfo{
    
    [[HttpClient sharedClient] requestWithUrl:@"http://wwww.baidu.com" params:nil httpMethod:@"get" sueccess:^(id response) {
        NSLog(@"callback of getAccountInfo. response is %@",response);
    } fail:^(NSError *error) {
        NSLog(@"callback of getAccountInfo. response is %@",error);
    }];
    
}

- (void)getAccountInfoWithParams{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"lala" forKey:@"name"];
    
    [[HttpClient sharedClient] requestWithUrl:@"http://wwww.baidu.com" params:params httpMethod:@"get" nTag:0 sKey:@"" success:^(id response) {
        NSLog(@"goooood");
    } fail:^(NSError *error) {
        NSLog(@"baaaaad");
    }];
    
}


@end
