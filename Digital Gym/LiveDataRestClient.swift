//
//  LiveDataRestClient.swift
//  Digital Gym
//
//  Created by Raghav Narasimhan  on 6/19/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class LiveDataRestClient {
    let uri = "http://localhost:8000"

    func getCurrentRpm(bikeID:Int) -> Promise<Hardware>{
        let q = DispatchQueue.global()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        let parameters: Parameters = ["bikeID": bikeID]

        return firstly {
            Alamofire.request(uri+"/bbb/rpmfrombikeid", method: .get, parameters: parameters).responseData()
            }
            .map(on: q) { data, rsp in
                try JSONDecoder().decode(Hardware.self, from: data)
            }
            .ensure {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }

    }
    
}

//4475502

