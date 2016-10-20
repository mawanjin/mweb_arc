//
//  HttpRequestItem.h
//  mweb_arc
//
//  Created by lala on 16/9/23.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpClient.h"
#import "AFURLSessionManager.h"



@interface HttpRequestItem : NSObject

@property (nonatomic,strong) NSURLSessionDataTask *task;
@property (nonatomic,strong) id   responseObject;
@property (nonatomic,copy) NSString *urlString;
@property (nonatomic,assign) NSInteger nTag;
@property (nonatomic,copy) NSString *sKey;
@property (nonatomic,weak) id<HttpClientDelegate> delegate;
@property (nonatomic,weak) HttpResponseSuccess success;
@property (nonatomic,weak) HttpResponseFail fail;

-(void) requestWithUrlString:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod;

@end
