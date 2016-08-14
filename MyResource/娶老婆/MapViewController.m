//
//  MapViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/31.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface MapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    MKMapView *_mapView;
}
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_mapView];
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationManager requestAlwaysAuthorization];
    }
}

//懒加载
- (CLLocationManager *)locationManager {
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc]init];
    }
    return locationManager;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.toolbar.backgroundColor = [UIColor clearColor];
    [super viewWillAppear:animated];
}

#pragma mark -- CoreLocation 代理
#pragma mark 跟踪定位代理方法，每次位置发生变化即会执行（只要定位到相应位置）
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count == 0||error) {
            NSLog(@"找不到位置");
            return ;
        }
        CLPlacemark *pm = [placemarks firstObject];
        userLocation.title = pm.locality;
        userLocation.subtitle = pm.name;
    }];
}
@end
