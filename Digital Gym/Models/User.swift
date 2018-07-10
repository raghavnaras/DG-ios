//
//  User.swift
//  DigitalGym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation

class User:Decodable{
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case token = "token"
        case success = "success"
        case message = "message"
        case image = "image"
        case name = "name"
        case email = "email"
        case password = "password"
       
    }
    var id: Int?
    var token: String?
    var success: Bool?
    var image: String?
    var name: String?
    var message: String?
    var email: String?
    var password: Int?
}

