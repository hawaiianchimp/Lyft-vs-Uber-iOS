//
//  Price.swift
//  Lyft vs Uber
//
//  Created by Sean Thomas Burke on 3/19/15.
//  Copyright (c) 2015 Nyquist Labs. All rights reserved.
//

import Foundation

class Price{
    var mile: Double
    var minute: Double
    var extra: Double
    var base: Double
    var minimum: Double
    
    init(mile: Double, minute: Double, extra: Double, base: Double, minimum: Double){
        self.mile = mile
        self.minute = minute
        self.extra = extra
        self.base = base
        self.minimum = minimum
    }
}