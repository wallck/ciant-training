//
//  ViewController.m
//  mapas
//
//  Created by Wallace Goncalves de Oliveira on 09/09/15.
//  Copyright (c) 2015 Wallace Goncalves de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate> {
    CLLocationManager *_locationManager;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentMapType;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _locationManager = [[CLLocationManager alloc] init];

    // Quanto mais preciso, mais gasta-se bateria pois utiliza-se mais recursos
    // para calcular a precisão da localização
    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    _locationManager.delegate = self;
    // NOTA: é preciso adicionar a chave NSLocationWhenInUseUsageDescription no info.plist
    [_locationManager requestWhenInUseAuthorization];
    
    // NOTA: é preciso adicionar a chave NSLocationAlwaysUsageDescription no info.plist
    [_locationManager requestAlwaysAuthorization];
}

// botao marcar
// - criar MKPointAnnotation
//   qualquer coordenadas (sugestao JACK ROCK BAR)
// - mapView addAnnotation
- (IBAction)markPoint:(UIButton *)sender {
    MKPointAnnotation *point = [MKPointAnnotation new];
    point.title = @"Jack Rock Bar";
    point.subtitle = @"Circuito do Mtrovilho";
    point.coordinate = CLLocationCoordinate2DMake(-19.9397464, -43.9297522);
    
    // Não funciona. Interessante seria implementar uma classe que herda do MKPointAnnotation
    // e implementar o Compare das coordenadas para que funcione
    //if(![_map.annotations containsObject:point])
    //    [_map addAnnotation:point];
    
    [_map removeAnnotations:_map.annotations];
    [_map addAnnotation:point];
    [_map setRegion: MKCoordinateRegionMakeWithDistance(point.coordinate, 2000.0, 2000.0)];
    
    // Overlay
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:point.coordinate radius:250.0];
    [_map removeOverlays:_map.overlays];
    [_map addOverlay:circle];
    
    // Outros Overlays
    // MKPolygon  -> MKPolygonRenderer
    // MKPolyline -> MKPolylineRenderer
    
    // Monitorar região
    CLCircularRegion *circleRegion = [[CLCircularRegion alloc]
                                      initWithCenter:point.coordinate
                                      radius:350.0
                                      identifier:@"Jack"];
    [_locationManager startMonitoringForRegion:circleRegion];
}

// botao centralizar
// - centraliza o mapa na CI&T (CLLocationCoodinate20Make)
- (IBAction)centralize:(UIButton *)sender {
    [_map setRegion: MKCoordinateRegionMakeWithDistance(_map.userLocation.coordinate, 2000.0, 2000.0)];
}

// segmento
// - trocar tipo do mapa de acordo com o segmento
- (IBAction)segmentTypeChanged:(UISegmentedControl *)sender {
    MKMapType mkType = (MKMapType)sender.selectedSegmentIndex;
    [_map setMapType:mkType];
}

#pragma Mark - MKMapViewDelegate

// delegate
// - mapView:viewForAnnotation:annotation
//   - criar MKPinAnnotationView somente se a annotacao for MKPointAnnotation
//   - resto retornar nil
#define ANOTATION_IDENTIFIER @"AnnotationIdentifier"
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {

    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        
        MKPinAnnotationView *pin = (MKPinAnnotationView*)[_map dequeueReusableAnnotationViewWithIdentifier:ANOTATION_IDENTIFIER];

        if (!pin) {
            pin = [[MKPinAnnotationView alloc]
                   initWithAnnotation:annotation
                   reuseIdentifier:ANOTATION_IDENTIFIER];
        
            pin.canShowCallout = YES;
            pin.pinColor = MKPinAnnotationColorGreen;
            pin.animatesDrop = YES;
            
            UIImage *image = [UIImage imageNamed:@""];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            pin.leftCalloutAccessoryView = imageView;
            
            UIButton *info = [UIButton buttonWithType:UIButtonTypeInfoLight];
            pin.rightCalloutAccessoryView = info;
        }
        
        return pin;
    }
    
    return nil;
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {

    if ([overlay isKindOfClass:[MKCircle class]]) {
        MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithCircle:overlay];
        
        renderer.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
        renderer.strokeColor = [UIColor redColor];
        renderer.lineWidth = 1.0;
        
        return renderer;
    }
    
    return nil;
}

-(void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error {
    NSLog(@"%@", error);
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSLog(@"{%.3f, %.3f}", userLocation.coordinate.latitude, userLocation.coordinate.longitude);
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"Autorizado Sempre");
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"Autorizado");
            break;
            
            // Usuário ainda nao escolheu nenhuma opcao
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"Indeterminado");
            break;
            
            // negou ou desabilitou
        case kCLAuthorizationStatusDenied:
            NSLog(@"Negado");
            break;
            
            // parental control, usuario nao tem permissoa para autorizar ou negar
        case kCLAuthorizationStatusRestricted:
            NSLog(@"Negado Restrito");
            break;
    }
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
