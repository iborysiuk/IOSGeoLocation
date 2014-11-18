//
//  ABCMapViewController.m
//  labTest_v1
//
//  Created by macadmin on 2014-10-07.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "ABCMapViewController.h"

@interface ABCMapViewController ()

@end

@implementation ABCMapViewController



- (IBAction)touchedElsewhere:(id)sender {
    [sender resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.zoomEnabled = YES;
    self.mapView.scrollEnabled = YES;
    self.mapView.showsUserLocation = YES;
    
    self.mapView.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
  
   // point.coordinate = [CLlo];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getLocation:(id)sender {
    
    
     MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = CLLocationCoordinate2DMake([_setLatitude.text doubleValue], [_setLongtitude.text doubleValue]);
        point.title = @"Where am I?";
        point.subtitle = _setDescription.text;
    
    
    MKCoordinateRegion region;
        region.center = CLLocationCoordinate2DMake([_setLatitude.text doubleValue], [_setLongtitude.text doubleValue]);
        region.span.latitudeDelta = 0.2;
        region.span.longitudeDelta = 0.2;
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    

    
    
    [self.mapView addAnnotation:point];
}
@end
