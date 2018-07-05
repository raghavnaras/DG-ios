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
        
//        if (Hardware.bikeID != nil) {
//
//        let alert = UIAlertController(title: "Live Data", message: "Your bikeID is \(Hardware.bikeID!). There is no live data to display.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
//        self.present(alert, animated: true)
//        }
//
//        else {
//            LiveDataOutput.text = "Scan QR code to see live data"
//        }
        
        let rest = LiveDataRestClient()
        let rpm = rest.getCurrentRpm(bikeID: Hardware.bikeID!)
        print (rpm)
//success is a boolean (true or false). On the backend code different things happen if success is true or false

        if (rpm == nil) {
            print("no live data found")
//            let elsealert = UIAlertController(title: "Live Data", message: "No live data found", preferredStyle: .alert)
//            elsealert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        }
    }
    
    @IBAction func HomePressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
}
    

