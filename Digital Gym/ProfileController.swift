//
//  ProfileController.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

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
        let rpmValue = rest.getData(serialNumber:Int(SerialNumberInput.text!)!)
        
        global_hardware.rpm = rpmValue
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LiveDataController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



