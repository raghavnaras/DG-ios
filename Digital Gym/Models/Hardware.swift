//
//  hardware.swift
//  Digital Gym
//
//  Created by Raghav Narasimhan  on 6/20/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation

class Hardware:Decodable {
    
    enum codingKeys: String, CodingKey {
        case serialNumber = "serialNumber"
        case rpm = "rpm"
    }
    
    var serialNumber: Int?
    var rpm: Int?
}
