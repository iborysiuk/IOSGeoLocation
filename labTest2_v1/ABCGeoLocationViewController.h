//
//  ABCGeoLocationViewController.h
//  labTest_v1
//
//  Created by macadmin on 2014-10-07.
//  Copyright (c) 2014 com.example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ABCGeoLocationViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *setLatitude;
@property (weak, nonatomic) IBOutlet UITextField *setLongtitude;
@property (weak, nonatomic) IBOutlet UILabel *getAddress;

- (IBAction)getLocation:(id)sender;

@end
