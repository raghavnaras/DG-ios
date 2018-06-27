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
    
    @IBOutlet weak var LiveDataOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LiveDataOutput.text = "Scan QR code to see live data"
        
        
        let alert = UIAlertController(title: "Live Data", message: "Your bikeID is \(Hardware.bikeID!). There is no live data to display.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)

        
//        let rest = LiveDataRestClient()
//        
//        if (Hardware.success)! {
//            let rpm = rest.getCurrentRpm(bikeID: Hardware.bikeID!)
//            print(rpm)
//        }
//        
//        else {
//            lastRPM.text="No live data found"
//        }
        
        //start timer to poll the server for updates
    }
}
    

