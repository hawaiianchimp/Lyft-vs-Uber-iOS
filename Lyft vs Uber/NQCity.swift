//
//  City.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation

class NQCity {
    var name: String
    var prices: NQPrices
    
    
    init(){
        self.name = ""
        self.prices = NQPrices()
    }
    
    init(name: String, prices: NQPrices){
        self.name = name
        self.prices = prices
    }
    
    init(name: String){
        self.name = name
        self.prices = NQPrices(cityName: name)
    }
}