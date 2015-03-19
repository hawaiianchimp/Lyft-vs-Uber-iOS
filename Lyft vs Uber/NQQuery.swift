//
//  Query.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation

class NQQuery {
    var distance: Double
    var time: Double
    var city: NQCity
    var size: String
    
    init(distance: Double, city:NQCity, time: Double, size: String) {
        self.distance = distance
        self.city = city
        self.time = time
        self.size = size
    }
    
    func cost() ->  Double {
        var price = city.prices.getPriceForSize(self.size)
        return max(price.base + price.minute*time + price.mile*distance + price.extra, price.minimum)
    }
}