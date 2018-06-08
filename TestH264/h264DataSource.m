//
//  h264DataSource.m
//  TestH264
//
//  Created by gaol on 2018/6/8.
//  Copyright © 2018年 gaol. All rights reserved.
//

#import "h264DataSource.h"

@implementation h264DataSource

+ (h264DataSource *)sharedInstance
{
    static h264DataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[h264DataSource alloc] init];
    });
    return sharedInstance;
}

-(void)setMWLH264:(WLH264 *)mWLH264 {
    _mWLH264 = mWLH264;
}
-(void)setMWLScreenController:(WLScreenController *)mWLScreenController {
    _mWLScreenController = mWLScreenController;
}
//WLH264Delegate
- (void)onH264DataReceive:(NSData *)data startTime:(double)startTime {
    NSLog(@"AAAA$$$$ onH264DataReceive %d\r\n",data.length);
    
    [self writefile:data];

}

-(void)writefile:(NSData *)data
{
    NSArray *paths  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *homePath = [paths objectAtIndex:0];
    
    NSString *filePath = [homePath stringByAppendingPathComponent:@"export229.mp4"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if(![fileManager fileExistsAtPath:filePath]) //如果不存在
    {
        [data writeToFile:filePath atomically:YES];
    }
    else//追加写入文件，而不是覆盖原来的文件
    {
        //        NSLog(@"-------文件存在，追加文件----------");
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
        
        [fileHandle seekToEndOfFile];  //将节点跳到文件的末尾
        
        [fileHandle writeData:data]; //追加写入数据
        
        [fileHandle closeFile];
    }
}

//ScreenDelegate
- (void)onDataChanged:(NSData *)data {
    NSLog(@"AAAA$$$$ onDataChanged\r\n");
    

}
- (void)onImageChanged:(UIImage *)image startTime:(double)startTime {
    NSLog(@"AAAA$$$$ onImageChanged \r\n");
    
    [_mWLH264 setCaptureImage:image startTime:startTime];

}
- (void)onCaptureChanged:(CMSampleBufferRef)sampleBuffer startTime:(double)startTime {
    NSLog(@"AAAA$$$$ onCaptureChanged \r\n");

}
@end
