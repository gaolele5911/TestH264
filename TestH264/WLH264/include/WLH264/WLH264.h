//
//  WLH264.h
//  WLH264
//
//  Created by chen lh on 16/4/27.
//  Copyright (c) 2016年 mapbar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>

@protocol WLH264Delegate
@optional
- (void)onH264DataReceive:(NSData *)data startTime:(double)startTime;
@end

@interface WLH264 : NSObject

- (id)initWithWidth:(int)width height:(int)height maxFrameRate:(int)maxFrameRate isEncodeRGBA:(BOOL)isEncodeRGBA;
- (void)setSize:(int)width height:(int)height maxFrameRate:(int)maxFrameRate isEncodeRGBA:(BOOL)isEncodeRGBA;
- (void)setDelegate:(id)delegate;

- (void)start;
- (void)stop;

- (void)setCaptureImage:(UIImage *)image startTime:(double)startTime;
- (void)setCVPixelBufferRef:(CVPixelBufferRef)buffer startTime:(double)startTime;

- (void)encodeFrame:(CMSampleBufferRef)sampleBuffer startTime:(double)startTime;

@end
