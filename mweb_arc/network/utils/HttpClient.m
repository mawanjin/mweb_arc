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


- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod delegate:(id<HttpClientDelegate>)delegate{
    return [self requestWithUrl:urlString params:params httpMethod:httpMethod delegate:delegate nTag:0 sKey:nil];
}

- (NSUInteger)requestWithUrl:(NSString *)urlString
                      params:(NSDictionary *)params
                  httpMethod:(NSString *)httpMethod
                    delegate:(id<HttpClientDelegate>)delegate
                        nTag:(NSInteger)nTag
                        sKey:(NSString *)sKey{
    HttpRequestItem *item = [[HttpRequestItem alloc] init];
    item.delegate = delegate;
    item.nTag = nTag;
    item.sKey = sKey;
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
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:item.responseObject options:NSJSONReadingMutableContainers error:nil];
        if(item.delegate && [item.delegate respondsToSelector:@selector(requestDidFinishWithData:urlString:nTag:sKey:)]){
            [item.delegate requestDidFinishWithData:data urlString:item.urlString nTag:item.nTag sKey:item.sKey];
        }
    }else{
        if(item.delegate && [item.delegate respondsToSelector:@selector(requestDidFinishWithData:urlString:nTag:sKey:)]){
            [item.delegate requestDidErrorWithData:error urlString:item.urlString nTag:item.nTag sKey:item.sKey];
        }
    }
}

@end
