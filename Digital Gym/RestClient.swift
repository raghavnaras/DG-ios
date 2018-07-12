//
//  File.swift
//  DigitalGym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

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
    
    let uri = "http://ec2-54-67-95-108.us-west-1.compute.amazonaws.com:8000"
    
    func login(email: String, password: String) -> Promise<User> {
        let q = DispatchQueue.global()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let parameters: Parameters = ["email": email, "password": password]
        
        return firstly {
            Alamofire.request(uri+"/bbb/login", method: .post, parameters: parameters).responseData()
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
            Alamofire.request(uri+"/bbb/setup_account", method: .post, parameters: parameters).responseData()
            }.map(on: q) { data, rsp in
                try JSONDecoder().decode(User.self, from: data)
            }.ensure {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    func deleteAccount(email: String, password: String) -> Promise<User> {
        let q = DispatchQueue.global()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let parameters: Parameters = ["email": email, "password": password]
        return firstly {
            Alamofire.request(uri+"/bbb/deleteaccount", method: .post, parameters: parameters).responseData()
            }.map(on: q) { data, rsp in
                try JSONDecoder().decode(User.self, from: data)
            }.ensure {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }

}

