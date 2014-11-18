//
//  ABCGeoLocationViewController.m
//  labTest_v1
//
//  Created by macadmin on 2014-10-07.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import "ABCGeoLocationViewController.h"

@interface ABCGeoLocationViewController ()

@end

@implementation ABCGeoLocationViewController{
   
    CLLocationManager *locManger;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    locManger = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchedElsewhere:(id)sender {
    [sender resignFirstResponder];
}


- (IBAction)getLocation:(id)sender {
    locManger.delegate = self;
    locManger.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locManger startUpdatingLocation];
}


 #pragma mark - CLLocationManagerDelegate Methods
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {

    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [errAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    
    //double myLatitude = 43.77325100;
    //double myLontitude = -79.33517100;
    
    NSString *Latitude = _setLatitude.text;
    NSString *Lontitude = _setLongtitude.text;
    
    double myLatitude = [Latitude doubleValue];
    double myLontitude = [Lontitude doubleValue];
    
  //  CLLocation *currentLocation = newLocation;
    CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:myLatitude longitude:myLontitude];
    
    
    if (currentLocation != nil) {
      //  _setLatitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
      //  _setLongtitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
    }
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            
            _getAddress.text = [NSString stringWithFormat:@"%@ %@, %@, %@, %@, %@",
                                placemark.subThoroughfare, placemark.thoroughfare,
                                placemark.postalCode, placemark.locality,
                                placemark.administrativeArea, placemark.country];
            
        }
    }];
}


/*
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
