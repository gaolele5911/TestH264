//
//  testH264.h
//  TestH264
//
//  Created by gaol on 2018/6/8.
//  Copyright © 2018年 gaol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface testH264 : NSObject

+ (testH264 *)sharedInstance;

-(void)startRecord;
-(void)stopReord;

-(void)setScreenMapView:(UIView *)mapview;

@end
