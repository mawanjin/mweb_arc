//
//  RpcAccount.h
//  mweb_arc
//
//  Created by lala on 16/9/23.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpClient.h"

@protocol RpcAccountDelegate <NSObject>

-(void) onReqAccountInfo;

@end

@interface RpcAccount:NSObject
    - (void)getAccountInfo;
    - (void)getAccountInfoWithParams;
@end
