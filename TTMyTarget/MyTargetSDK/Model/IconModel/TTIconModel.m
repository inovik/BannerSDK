//
//  TTIconModel.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTIconModel.h"

@implementation TTIconModel

@synthesize iconLink, iconWidth, iconHeight;

- (instancetype)initWith:(NSString *)link iconWidth:(NSInteger)width iconHeight:(NSInteger)height{
    if ( self == [super init] )
    {
        self.iconLink = link;
        self.iconWidth = width;
        self.iconHeight = height;
    }
    return self;
}

@end
