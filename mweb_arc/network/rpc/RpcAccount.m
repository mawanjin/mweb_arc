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
    [[HttpClient sharedClient] requestWithUrl:@"http://www.baidu.com" params:nil httpMethod:@"get" delegate:self nTag:0 sKey:@"accountInfo"];
}

- (void)getAccountINFoByParams:(NSString *) url params:(NSDictionary *)params httpMethod:(NSString *)httpMethod delegate:(id<HttpClientDelegate>) delegate{
    [[HttpClient sharedClient] requestWithUrl:url params:params httpMethod:httpMethod delegate:delegate];
}

- (void) requestDidFinishWithData:(NSDictionary *)data urlString:(NSString *)urlString nTag:(NSInteger)nTag sKey:(NSString *)sKey{
    NSLog(@"method requestDidFinishWithData() called.sKey=%@",sKey);
}

- (void) requestDidErrorWithData:(NSError *)error urlString:(NSString *)urlString nTag:(NSInteger)nTag sKey:(NSString *)sKey{
    NSLog(@"method requestDidErrorWithData() called.sKey=%@",sKey);
}

@end
