//
//  TTTransportService.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTTransportService.h"
#import "TTResponseSerializer.h"

@interface TTTransportService ()

@property (nonatomic, strong) id<TTResponseSerializerProtocol> jsonSerializer;
@end

@implementation TTTransportService

- (void)obtainJsonModelFromURL:(NSURL *)downloadURL
                    withSucces:(TTTransportServiceSuccesBlock)succesBlock
                    andFailure:(TTTransportServiceFailureBlock)failureBlock{
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:downloadURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if ( !error )
        {
            id jsonObject = [self.jsonSerializer responseObjectForResponse:response data:data];
            succesBlock(jsonObject);

        }else{
            failureBlock(error);
        }
    }] resume];
}

- (void)obtainImageFromURL:(NSURL *)downloadURL
                withSucces:(TTTransportServiceSuccesBlock)succesBlock
                andFailure:(TTTransportServiceFailureBlock)failureBlock{
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:downloadURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if ( !error )
        {
            succesBlock(data);
            
        }else{
            failureBlock(error);
        }
    }] resume];
}

- (id<TTResponseSerializerProtocol>)jsonSerializer{
    if(!_jsonSerializer ){
        _jsonSerializer = [TTResponseSerializer new];
    }
    return _jsonSerializer;
}


@end
