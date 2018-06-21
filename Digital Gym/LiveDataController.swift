//
//  LiveData.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//
import Foundation
import UIKit
import Alamofire

class LiveDataController: UIViewController{
    
    let uri="http://ec2-54-67-95-108.us-west-1.compute.amazonaws.com:8000"
    
    @IBOutlet weak var lastRPM: UILabel!
    @IBOutlet weak var LiveDataOutput: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LiveDataOutput.text = "Live Data"
        lastRPM.text = String(global_hardware.rpm!)
        
        //start timer to poll the server for updates
    }
}
    

