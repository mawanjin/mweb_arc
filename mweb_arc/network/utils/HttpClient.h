//
//  HttpClient.h
//  mweb_arc
//
//  Created by lala on 16/9/23.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpRequestItem;

@protocol HttpClientDelegate <NSObject>

- (void) requestDidFinishWithData:(NSDictionary *)data urlString:(NSString *)urlString nTag:(NSInteger)nTag sKey:(NSString *)sKey;
- (void) requestDidErrorWithData:(NSError *)error urlString:(NSString *)urlString nTag:(NSInteger)nTag sKey:(NSString *)sKey;

@end

@interface HttpClient : NSObject

@property(nonatomic,strong) NSMutableDictionary *items;

+ (HttpClient *) sharedClient;

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod delegate:(id<HttpClientDelegate>)delegate;

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod delegate:(id<HttpClientDelegate>)delegate nTag:(NSInteger)nTag;

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod delegate:(id<HttpClientDelegate>)delegate sKey:(NSString *)sKey;

- (NSUInteger) requestWithUrl:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod delegate:(id<HttpClientDelegate>)delegate nTag:(NSInteger)nTag sKey:(NSString *)sKey;

- (BOOL)cancelRequestWithHashValue:(NSInteger)hashValue;


@end
