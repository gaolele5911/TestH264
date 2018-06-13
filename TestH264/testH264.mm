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
#import "h264DataSource.h"

@interface testH264 ()

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
//    _mWLH264 = [[WLH264 alloc] init];
//    [_mWLH264 setSize:SCREENWIDTH height:SCREENHEIGHT maxFrameRate:CAPTUREFPS isEncodeRGBA:YES];
    _mWLH264 = [[WLH264 alloc]initWithWidth:SCREENWIDTH height:SCREENHEIGHT maxFrameRate:CAPTUREFPS isEncodeRGBA:YES];
    _mWLScreenController = [[WLScreenController alloc]init];

    [h264DataSource sharedInstance].mWLH264 = _mWLH264;
    [h264DataSource sharedInstance].mWLScreenController = _mWLScreenController;
    
    [_mWLH264 setDelegate:[h264DataSource sharedInstance]];
    [_mWLScreenController setDelegate:[h264DataSource sharedInstance]];
    [_mWLScreenController setCodecMode:CODECMODE];
    [_mWLScreenController setCaptureFPS:CAPTUREFPS];
    [_mWLScreenController setCaptureSize:SCREENWIDTH height:SCREENHEIGHT orientation:YES];
}

-(void)startRecord {
    
    [self removeFile:IMAGENAME];
    [self removeFile:FILENAME];
    
    [_mWLScreenController startScreen];
    [_mWLH264 start];
}

-(void)stopReord {
    [_mWLScreenController stopScreen];
    [_mWLH264 stop];
}

-(void)removeFile:(NSString *)name
{
    NSArray *paths  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *homePath = [paths objectAtIndex:0];
    
    NSString *filePath = [homePath stringByAppendingPathComponent:name];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:filePath]) //如果不存在
    {
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

@end
