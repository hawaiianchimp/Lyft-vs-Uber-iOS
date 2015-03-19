//
//  Price.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation

class NQPrice{
    var mile: Double
    var minute: Double
    var extra: Double
    var base: Double
    var minimum: Double
    var disclaimer_airport: String
    var disclaimer_tolls: String
    var disclaimer_city: String
    var service: String
    var vehicle: String
    
    init(){
        self.mile = 0.00
        self.minute = 0.00
        self.extra = 0.00
        self.base = 0.00
        self.minimum = 0.00
        self.disclaimer_airport = ""
        self.disclaimer_tolls = ""
        self.disclaimer_city = ""
        self.service = ""
        self.vehicle = ""
    }
    
    init(mile: Double, minute: Double, extra: Double, base: Double, minimum: Double, disclaimer_airport: String, disclaimer_tolls: String, disclaimer_city: String, service: String, vehicle: String){
        self.mile = mile
        self.minute = minute
        self.extra = extra
        self.base = base
        self.minimum = minimum
        self.disclaimer_airport = disclaimer_airport
        self.disclaimer_tolls = disclaimer_tolls
        self.disclaimer_city = disclaimer_city
        self.service = service
        self.vehicle = vehicle
    }
    
    init(price: PFObject){
        println("Creating Price from PFObject")
        self.mile = (price["mile"] != nil) ? price["mile"] as Double : 0.00
        self.minute = (price["minute"] != nil) ?  price["minute"] as Double : 0.00
        self.extra = (price["extra"] != nil) ? price["extra"] as Double: 0.00
        self.base = (price["base"] != nil) ? price["base"] as Double: 0.00
        self.minimum = (price["minimum"] != nil) ? (price["minimum"]) as Double: 0.00
        self.disclaimer_airport = (price["disclaimer_airport"] != nil) ? price["disclaimer_airport"] as String: ""
        self.disclaimer_city = (price["disclaimer_city"] != nil) ? price["disclaimer_city"] as String: ""
        self.disclaimer_tolls = (price["disclaimer_tolls"] != nil) ? price["disclaimer_tolls"] as String: ""
        self.service = (price["service"] != nil) ? price["service"] as String:""
        self.vehicle = (price["vehicle"]  != nil) ? price["vehicle"] as String:""
    }
}