//
//  HttpRequestItem.m
//  mweb_arc
//
//  Created by lala on 16/9/23.
//  Copyright © 2016年 mawj. All rights reserved.
//

#import "HttpRequestItem.h"

@implementation HttpRequestItem

-(void) requestWithUrlString:(NSString *)urlString params:(NSDictionary *)params httpMethod:(NSString *)httpMethod{
    NSURLRequest *request;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    if([[httpMethod lowercaseString] isEqualToString:@"post"]){
        request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlString parameters:params error:nil];
    }else{
       request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:params error:nil];
    }
    
    NSLog(@"-----------url:%@-----------",urlString);
    
    __weak __typeof(self) weakSelf = self;
    //do request
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        weakSelf.responseObject = responseObject;
        if(error){
            NSLog(@"Error: %@",error);
        }else{
            NSHTTPURLResponse *res = (NSHTTPURLResponse*)response;
            NSLog(@"status_code:%d",res.statusCode);
            NSLog(@"headers:%@",res.allHeaderFields);
        }        

        [[HttpClient sharedClient] performSelector:@selector(didFinishWithItem:error:) withObject:weakSelf withObject:error];
        
    }];
    
    [dataTask resume];
    self.urlString = urlString;
    self.task = dataTask;
}
@end
