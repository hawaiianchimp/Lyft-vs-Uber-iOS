//
//  Query.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation

class Query {
    var distance: Double
    var time: Double
    var city: String
    var prices: Dictionary<String,Price>
    var size: String
    
    init(prices: Dictionary<String,Price>, distance: Double, city:String, time: Double, size: String) {
        self.prices = prices
        self.distance = distance
        self.city = city
        self.time = time
        self.size = size
    }
    
    func cost() ->  Double {
        var price = prices[size]
        return max(price!.base + price!.minute*time + price!.mile*distance + price!.extra, price!.minimum)
    }
}