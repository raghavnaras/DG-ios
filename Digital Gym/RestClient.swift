//
//  File.swift
//  DigitalGym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import PromiseKit 
import Alamofire

class RestClient{

    let uri = "http://127.0.0.1:5000"
    func login(email: String, password: String) -> Promise<User> {
        let q = DispatchQueue.global()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let parameters: Parameters = ["email": email, "password": password]
        
        return firstly {
            Alamofire.request(uri+"/login", method: .post, parameters: parameters).responseData()
            }.map(on: q) { data, rsp in
                try JSONDecoder().decode(User.self, from: data)
            }.ensure {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    func register(email: String, password: String, name: String) -> Promise<User> {
        let q = DispatchQueue.global()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let parameters: Parameters = ["email": email, "password": password, "name": name]
        
        return firstly {
            Alamofire.request(uri+"/setup_account", method: .post, parameters: parameters).responseData()
            }.map(on: q) { data, rsp in
                try JSONDecoder().decode(User.self, from: data)
            }.ensure {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }

}
