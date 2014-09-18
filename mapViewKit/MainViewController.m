//
//  MainViewController.m
//  mapKitTest
//
//  Created by xiazer on 14-9-18.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
//user最新2d
@property(nonatomic, assign) CLLocationCoordinate2D nowCoords;

@end

@implementation MainViewController

- (NSInteger)windowWidth {
    return [[[[UIApplication sharedApplication] windows] objectAtIndex:0] frame].size.width;
}
- (NSInteger)windowHeight {
    return [[[[UIApplication sharedApplication] windows] objectAtIndex:0] frame].size.height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"mapkit Test";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, [self windowWidth], [self windowHeight] - 44 - 20)];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    [self.view addSubview:self.mapView];
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.latitudeDelta = 0.0187f;
    region.span.longitudeDelta = 0.0137f;
    [self.mapView setRegion:region animated:YES];
    
//    _initialPosition = NO;
}

#pragma mark MKMapViewDelegate -user location定位变化
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.nowCoords = [userLocation coordinate];
    NSLog(@"self.nowCoords---->>%f/%f",self.nowCoords.latitude,self.nowCoords.longitude);
}


@end
