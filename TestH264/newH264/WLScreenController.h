//
//  WLScreenController.h
//  WLScreenController
//
//  Created by chenlh on 15/8/27.
//  Copyright (c) 2015年 mapbar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreMedia/CMSampleBuffer.h>
#import <GLKit/GLKit.h>

@protocol ScreenDelegate
@optional
- (void)onDataChanged:(NSData *)data;
- (void)onImageChanged:(UIImage *)image startTime:(double)startTime;
- (void)onCaptureChanged:(CMSampleBufferRef)sampleBuffer startTime:(double)startTime;
@end

@interface WLScreenController : NSObject

- (void)setDelegate:(id)delegate;
- (void)startScreen;
- (void)stopScreen;
- (void)setCodecMode:(int)codecMode;
- (void)setCaptureSize:(int)width height:(int)height orientation:(BOOL)portrait;
- (void)setCaptureFPS:(int)captureFPS;
- (NSData *)getCaptureData;
- (void)resetCapture;
-(void)setScreenMapView:(UIView *)mapview;
@end
