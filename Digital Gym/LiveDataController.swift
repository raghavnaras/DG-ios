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
        
         self.LiveDataOutput.text = "No live data found. Start biking to see live data."
        
        let rest = LiveDataRestClient()
        _ = rest.getCurrentRpm(machineID: Hardware.machineID!).done { (hardware) in
        
            if(hardware.success)! {
                global_hardware = hardware
                self.LiveDataOutput.text = "Live data found. Scan QR code to view"
                self.alert(message: hardware.message!)
            }
            else {
                self.alert(message: hardware.message!)
            }
    }
}
    @IBAction func HomePressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
//
//if(user.success)!{
//    global_user = user
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
//    self.navigationController?.pushViewController(vc, animated: true)
//}else{
//    self.alert(message: user.message!)
//}
