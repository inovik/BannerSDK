//
//  TTTransportServiceProtocol.h
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTTransportServiceProtocol <NSObject>

typedef void(^TTTransportServiceFailureBlock)(NSError *error);
typedef void(^TTTransportServiceSuccesBlock)(id object);

/*!
 *  Load json object from server
 *
 *  @param downloadURL  url to download
 *  @param succesBlock  called when the operation is completed successfully and return the data object
 *  @param failureBlock called when the operation is complete with failure and return an error object
 */
- (void)obtainJsonModelFromURL:(NSURL *)downloadURL
                    withSucces:(TTTransportServiceSuccesBlock)succesBlock
                    andFailure:(TTTransportServiceFailureBlock)failureBlock;

/*!
 *  Load image from server
 *
 *  @param downloadURL  url to download
 *  @param succesBlock  called when the operation is completed successfully and return the data object
 *  @param failureBlock called when the operation is complete with failure and return an error object
 */
- (void)obtainImageFromURL:(NSURL *)downloadURL
                    withSucces:(TTTransportServiceSuccesBlock)succesBlock
                    andFailure:(TTTransportServiceFailureBlock)failureBlock;
@end
