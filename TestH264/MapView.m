//
//  MapView.m
//  TestH264
//
//  Created by gaol on 2018/6/11.
//  Copyright © 2018年 gaol. All rights reserved.
//

#import "MapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

@implementation MapView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame {

    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:frame];
    self = mapView;
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.delegate = nil; // 不用时，置nil
}
@end
