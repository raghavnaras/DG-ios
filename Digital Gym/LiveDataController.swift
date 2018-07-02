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
        
        if (Hardware.bikeID != nil) {

        let alert = UIAlertController(title: "Live Data", message: "Your bikeID is \(Hardware.bikeID!). There is no live data to display.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
            
        }
            
        else {
            let alert = UIAlertController(title: "Live Data", message: "BikeID has not been scanned yet. Scan bikeID to view live data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
        }

//        let rest = LiveDataRestClient()

//        if (Hardware.success)! && (Hardware.success != nil){ //success is a boolean (true or false). On the backend code different things happen if success is true or false
//            let currentrpm = rest.getCurrentRpm(bikeID: Hardware.bikeID!)
//            print (currentrpm)
//        }
        
//        if (Hardware.success == nil) {
//            let elsealert = UIAlertController(title: "Live Data", message: "No live data found", preferredStyle: .alert)
//            elsealert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
//        }
        //start timer to poll the server for updates
    }
    @IBAction func ScanButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
    

