//
//  StartLocation.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import AddressBook

class NQLocation: CLLocationManager {
    var city: NQCity
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(address: String){
        self.city = NQCity()
        super.init()
        geocodeAddress(address)
    }
    
    func geocodeAddress(address: String){
        
        
        var geo = CLGeocoder()
        func handleLocation(placemarks: [AnyObject]!, error: NSError!){
            if(error?.code > 0){
                println(error)
            }
            else if(placemarks?.count > 0){
                let placemark = placemarks[0] as CLPlacemark
                let city = placemark.addressDictionary["SubAdministrativeArea"]! as String
                self.city = NQCity(name: city)
                println(self.city.name)
            }
            else{
                println("unknown error");
            }
        }
        
        geo.geocodeAddressString(address, completionHandler: handleLocation)
        var geoAddress = CLGeocoder.geocodeAddressDictionary(geo);
    }
    
    func reverseGeocode(location: CLLocation){
        var geo = CLGeocoder();
        func handleReverseGeocode(placemarks: [AnyObject]!, error: NSError!){
            if(error?.code > 0){
                println(error)
            }
            else if(placemarks?.count > 0){
                let placemark: CLPlacemark = placemarks[0] as CLPlacemark
                println(placemark.location)
            }
            else{
                println("unknown error");
            }
        }
        geo.reverseGeocodeLocation(location, completionHandler: handleReverseGeocode)
        
    }
}