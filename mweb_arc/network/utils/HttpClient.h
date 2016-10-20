//
//  HttpClient.h
//  mweb_arc
//
//  Created by lala on 16/9/23.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpResponseSuccess)(id response);
typedef void(^HttpResponseFail)(NSError *error);

@class HttpRequestItem;

@protocol HttpClientDelegate <NSObject>

- (void) requestDidFinishWithData:(NSDictionary *)data urlString:(NSString *)urlString nTag:(NSInteger)nTag sKey:(NSString *)sKey;
- (void) requestDidErrorWithData:(NSError *)error urlString:(NSString *)urlString nTag:(NSInteger)nTag sKey:(NSString *)sKey;

@end

@interface HttpClient : NSObject

@property(nonatomic,strong) NSMutableDictionary *items;

+ (HttpClient *) sharedClient;

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod sueccess:(HttpResponseSuccess) success fail:(HttpResponseFail) fail;

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod nTag:(NSInteger)nTag success:(HttpResponseSuccess) success fail:(HttpResponseFail) fail;

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod sKey:(NSString *) sKey success:(HttpResponseSuccess) success fail:(HttpResponseFail) fail;

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod nTag:(NSInteger)nTag sKey:(NSString *) sKey success:(HttpResponseSuccess) success fail:(HttpResponseFail) fail;


- (BOOL)cancelRequestWithHashValue:(NSInteger)hashValue;

@end
