//
//  City.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation

class City {
    var name: String
    var prices: Dictionary<String, Price>
    init(name: String, prices: Dictionary<String, Price>){
        self.name = name
        self.prices = prices
    }
    
    init(name: String){
        self.name = name
        var prices = Prices(cityName: name)
        self.prices = prices.priceDictionary
        
    }
}