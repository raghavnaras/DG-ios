//
//  ProfileController.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var SerialNumberInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "Name: \(global_user.name!)"
        email.text = "Email: \(global_user.email!)"

    }

    @IBAction func SeeDataPressed(_ sender: Any) {
        let rest = LiveDataRestClient()
        let rpm = rest.getData(serialNumber:Int(SerialNumberInput.text!)!)
            
        global_hardware.rpm = rpm
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LiveDataController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



