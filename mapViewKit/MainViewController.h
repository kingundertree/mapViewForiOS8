//
//  MainViewController.h
//  mapKitTest
//
//  Created by xiazer on 14-9-18.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
@property(nonatomic, strong) MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end
