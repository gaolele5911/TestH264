//
//  h264DataSource.h
//  TestH264
//
//  Created by gaol on 2018/6/8.
//  Copyright © 2018年 gaol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLH264.h"
#import "WLScreenController.h"

#define SCREENWIDTH  ((([[UIScreen mainScreen] bounds].size.width) > ([[UIScreen mainScreen] bounds].size.height))?(([[UIScreen mainScreen] bounds].size.width)):(([[UIScreen mainScreen] bounds].size.height)))
#define SCREENHEIGHT  ((([[UIScreen mainScreen] bounds].size.width) < ([[UIScreen mainScreen] bounds].size.height))?(([[UIScreen mainScreen] bounds].size.width)):(([[UIScreen mainScreen] bounds].size.height)))

#define CAPTUREFPS 30
#define CODECMODE 2  // 影像编码模式(0x01:JPEG, 0x02:VEDIO, 0x03:JPEG&VEDIO)
#define FILENAME @"H264Data.mp4"

@interface h264DataSource : NSObject<WLH264Delegate,ScreenDelegate>

@property (nonatomic,strong)WLH264 *mWLH264;
@property (nonatomic,strong)WLScreenController *mWLScreenController;
+ (h264DataSource *)sharedInstance;

@end
