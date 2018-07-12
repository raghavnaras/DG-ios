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
    let uri = "http://ec2-54-67-95-108.us-west-1.compute.amazonaws.com:8000" //link to the server
    func getCurrentRpm(machineID:Int) -> Promise<Hardware> {
        let q = DispatchQueue.global()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let parameters: Parameters = ["machineID": machineID] //parameters are basically required input in order for this method to work

        return firstly {
            Alamofire.request(uri+"/bbb/rpmfrombikeid", method: .get, parameters: parameters).responseData() //sending request to server
            }
            .map(on: q) { data, rsp in
                try JSONDecoder().decode(Hardware.self, from: data) //server sends data back as a JSON object so you have to decode this to be able to read it
            }
            .ensure {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
