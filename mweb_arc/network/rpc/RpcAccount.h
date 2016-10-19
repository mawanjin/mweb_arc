//
//  RpcAccount.h
//  mweb_arc
//
//  Created by lala on 16/9/23.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpClient.h"

@interface RpcAccount : NSObject<HttpClientDelegate>

- (void)getAccountInfo;
- (void)getAccountINFoByParams:(NSString *) url params:(NSDictionary *)params httpMethod:(NSString *)httpMethod delegate:(id<HttpClientDelegate>) delegate;

@end
