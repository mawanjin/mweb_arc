//
//  HttpClient.m
//  mweb_arc
//
//  Created by lala on 16/9/23.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import "HttpClient.h"
#import "HttpRequestItem.h"

@implementation HttpClient


+ (HttpClient *) sharedClient{
    static HttpClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] init];
        _sharedClient.items = [NSMutableDictionary dictionary];
    
    });
    
    return _sharedClient;
}


- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod sueccess:(HttpResponseSuccess) success fail:(HttpResponseFail) fail{
    return [self requestWithUrl:urlString params:params httpMethod:httpMethod nTag:0 sKey:nil success:success fail:fail];
}

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod nTag:(NSInteger)nTag success:(HttpResponseSuccess) success fail:(HttpResponseFail) fail{
    return [self requestWithUrl:urlString params:params httpMethod:httpMethod nTag:nTag sKey:@"" success:success fail:fail];
}

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod sKey:(NSString *) sKey success:(HttpResponseSuccess) success fail:(HttpResponseFail) fail{
    return [self requestWithUrl:urlString params:params httpMethod:httpMethod nTag:0 sKey:sKey success:success fail:fail];
}

- (NSUInteger)requestWithUrl:(NSString *)urlString
                      params:(NSDictionary *)params
                  httpMethod:(NSString *)httpMethod
                        nTag:(NSInteger)nTag
                        sKey:(NSString *)sKey success:(HttpResponseSuccess)success fail:(HttpResponseFail) fail{
    HttpRequestItem *item = [[HttpRequestItem alloc] init];
    item.nTag = nTag;
    item.sKey = sKey;
    item.success = success;
    item.fail = fail;
    [item requestWithUrlString:urlString params:params httpMethod:httpMethod];
    
    NSUInteger hashValue = [item hash];
    [self.items setObject:item forKey:@(hashValue)];
    return hashValue;
}


- (BOOL)cancelRequestWithHashValue:(NSInteger)hashValue{
    HttpRequestItem *item = [_items objectForKey:@(hashValue)];
    if(item){
        [item.task cancel];
        [_items removeObjectForKey:@(hashValue)];
    }
    return YES;
}

- (void) removeItem:(HttpRequestItem *)item{
    NSUInteger hashValue = [item hash];
    id object = [_items objectForKey:@(hashValue)];
    if (object != nil) {
        [[(HttpRequestItem *)object task] cancel];
        [_items removeObjectForKey:@(hashValue)];
    }
}

- (void) didFinishWithItem:(HttpRequestItem *)item error:(NSError *)error{
    NSLog(@"method didFinishWithItem called.");
    if(error == nil){
        NSString *rs = [[NSString alloc] initWithData:item.responseObject encoding:NSUTF8StringEncoding];
        item.success(rs);
    }else{
        item.fail(error);
    }
    
    [self removeItem:item];
}

@end
