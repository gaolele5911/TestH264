//
//  testH264.m
//  TestH264
//
//  Created by gaol on 2018/6/8.
//  Copyright © 2018年 gaol. All rights reserved.
//

#import "testH264.h"
#import "WLH264.h"
#import "WLScreenController.h"

@interface testH264 ()

//@property (nonatomic,strong)QQMusicDataSource *musicDS;
@property (nonatomic,strong)WLH264 *mWLH264;
@property (nonatomic,strong)WLScreenController *mWLScreenController;

@end

@implementation testH264

+ (testH264 *)sharedInstance
{
    static testH264 *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[testH264 alloc] init];
        [sharedInstance _initData];
    });
    return sharedInstance;
}

- (void)_initData
{
//    - (id)initWithWidth:(int)width height:(int)height maxFrameRate:(int)maxFrameRate isEncodeRGBA:(BOOL)isEncodeRGBA;

//    _mWLH264 = [WLH264 initWithWidth:500 height:500 maxFrameRate:30 isEncodeRGBA:YES];
}

@end
